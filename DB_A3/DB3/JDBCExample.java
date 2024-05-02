package DB_A3.DB3;
import java.sql.*;

public class JDBCExample {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/uct_science";
        String username = "root";
        String password = "Aborate-cole2011@";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String query = "SELECT * FROM uct_science.Student";
            PreparedStatement statement = conn.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String studentID = resultSet.getString("StudentID");
                String firstName = resultSet.getString("FirstName");
                String lastName = resultSet.getString("LastName");
                String email = resultSet.getString("Email");
                String currentFaculty = resultSet.getString("CurrentFaculty");
                String applicationStatus = resultSet.getString("ApplicationStatus");
                String funding = resultSet.getString("Funding");
                String careerLevel = resultSet.getString("CareerLevel");

                System.out.println("StudentID: " + studentID);
                System.out.println("FirstName: " + firstName);
                System.out.println("LastName: " + lastName);
                System.out.println("Email: " + email);
                System.out.println("CurrentFaculty: " + currentFaculty);
                System.out.println("ApplicationStatus: " + applicationStatus);
                System.out.println("Funding: " + funding);
                System.out.println("CareerLevel: " + careerLevel);
                System.out.println();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}