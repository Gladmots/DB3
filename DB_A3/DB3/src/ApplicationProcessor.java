import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Driver;
import java.sql.DriverManager;
import java.util.Enumeration;

public class ApplicationProcessor {
    private static boolean driverLoadedSuccessfully = false;
    static {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            driverLoadedSuccessfully = true;
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found.");
            e.printStackTrace();
        }
    }
    static final String DATABASE_URL = "jdbc:mysql://localhost:3306/uct_science";
    static final String USERNAME = "root"; //your specific username
    static final String PASSWORD = "Aborate-cole2011@"; //your specific password
    public static void main(String[] args) {
      
     
        try (Connection connection =  DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD)) {

            System.out.println("Connected to the database successfully.");
            String studentId = "smijoh020"; // This would come from user input (Candidate Key between relations)
            String applicationStatus = getApplicantStatus(connection, studentId);
            System.out.println("Application Status: " + applicationStatus);

            if ("New".equals(applicationStatus)) {
                boolean isEligible = checkEligibility(connection, studentId);
                if (isEligible) {
                    System.out.println("Applicant meets course requirements for desired major.");
                    // Update database to mark application as accepted
                    updateApplicationStatus(connection, studentId, "Accepted");
                } else {
                    System.out.println("Applicant does not meet course requirements for desired major.");
                    // Update database to mark application as rejected
                    updateApplicationStatus(connection, studentId, "Rejected");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed to connect to the database");
        }
    }

    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
    }

    private static String getApplicantStatus(Connection connection, String studentId) throws SQLException {
        String status = null;
        String sql = "SELECT ApplicationStatus FROM Students WHERE StudentID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, studentId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    status = resultSet.getString("ApplicationStatus");
                }
            }
        }
        return status;
    }

    private static boolean checkEligibility(Connection connection, String studentId) throws SQLException {
        boolean isEligible = false;
       
        int majorID = MajorIDForStudent(connection, studentId);
        String sql = "SELECT COUNT(DISTINCT cr.CourseID) AS RequiredCourses, " +
                     "(SELECT COUNT(*) FROM StudentCourses sc WHERE sc.StudentID = ? AND sc.CourseID IN " +
                     "(SELECT cr.CourseID FROM CourseRequirements cr WHERE cr.MajorID = ?)) AS CompletedCourses " +
                     "FROM CourseRequirements cr WHERE cr.MajorID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, studentId);
            statement.setInt(2, majorID);
            statement.setInt(3, majorID);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next() && resultSet.getInt("CompletedCourses") >= resultSet.getInt("RequiredCourses")) {
                    isEligible = true;
                }
            }
        }
        return isEligible;
    }

    private static int MajorIDForStudent(Connection connection, String studentId) throws SQLException {
        int majorID = 0;
        String sql = "SELECT MajorID FROM StudentPrograms WHERE StudentID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, studentId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    majorID = resultSet.getInt("MajorID");
                }
            }
        }
        return majorID;
    }

    private static void updateApplicationStatus(Connection connection, String studentId, String newStatus) throws SQLException {
        String sql = "UPDATE Students SET ApplicationStatus = ? WHERE StudentID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, newStatus);
            statement.setString(2, studentId);
            statement.executeUpdate();
        }
    }
}
