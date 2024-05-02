import java.sql.*;

public class StudentTransferChecker {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/uct_science";
        String username = "root";
        String password = "Aborate-cole2011@";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String studentID = "mohmoh010"; // Replace with the desired student ID

            // Check if the student passed at least 3 courses
            int passedCourses = countPassedCourses(conn, studentID);
            if (passedCourses < 3) {
                System.out.println("Student " + studentID + " did not pass at least 3 courses.");
                return;
            }

            // Check if the student meets the Matric requirements
            if (!meetsMatricRequirements(conn, studentID)) {
                System.out.println("Student " + studentID + " does not meet the Matric requirements.");
                return;
            }

            System.out.println("Student " + studentID + " is eligible to transfer to a BSc program.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static int countPassedCourses(Connection conn, String studentID) throws SQLException {
        String query = "SELECT COUNT(*) FROM uct_science.AcademicRecord WHERE StudentID = ? AND Grade >= 50";
        PreparedStatement statement = conn.prepareStatement(query);
        statement.setString(1, studentID);
        ResultSet resultSet = statement.executeQuery();
        resultSet.next();
        return resultSet.getInt(1);
    }

    private static boolean meetsMatricRequirements(Connection conn, String studentID) throws SQLException {
        String query = "SELECT Mathematics, PhysicalScience, InformationTechnology FROM uct_science.MatricInformation WHERE StudentID = ?";
        PreparedStatement statement = conn.prepareStatement(query);
        statement.setString(1, studentID);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            int mathematicsScore = resultSet.getInt("Mathematics");
            int physicalScienceScore = resultSet.getInt("PhysicalScience");
            int informationTechnologyScore = resultSet.getInt("InformationTechnology");

            return mathematicsScore >= 70 && (physicalScienceScore >= 60 || informationTechnologyScore >= 60);
        }

        return false;
    }
}