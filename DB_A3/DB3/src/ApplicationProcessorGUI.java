import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

public class ApplicationProcessorGUI {
    private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/uct_science";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Aborate-cole2011@";
    private static JFrame frame;
    private static JTextField studentIdField;
    private static JTextArea resultArea;

    static {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "MySQL JDBC Driver not found.");
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        // Create frame
        frame = new JFrame("Application Processor");
        frame.setSize(400, 300);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(new FlowLayout());

        // Create components
        JLabel studentIdLabel = new JLabel("Enter Student ID:");
        studentIdField = new JTextField(15);
        JButton submitButton = new JButton("Submit");
        resultArea = new JTextArea(10, 30);
        resultArea.setEditable(false);

        // Add components to frame
        frame.add(studentIdLabel);
        frame.add(studentIdField);
        frame.add(submitButton);
        frame.add(new JScrollPane(resultArea));

        // Action Listener for button
        submitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                processApplication();
            }
        });

        // Set frame visibility
        frame.setVisible(true);
    }

    private static void processApplication() {
        String studentIdText = studentIdField.getText();
        if (studentIdText.isEmpty()) {
            JOptionPane.showMessageDialog(frame, "Please enter a Student ID");
            return;
        }

        int studentId;
        try {
            studentId = Integer.parseInt(studentIdText);
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(frame, "Invalid Student ID format");
            return;
        }

        try (Connection connection = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD)) {
            String applicationStatus = getApplicantStatus(connection, studentId);
            boolean isEligible = checkEligibility(connection, studentId);
            String statusUpdateMessage = "No action taken.";

            if ("New".equals(applicationStatus)) {
                if (isEligible) {
                    updateApplicationStatus(connection, studentId, "Accepted");
                    statusUpdateMessage = "Applicant meets course requirements for desired major. Status updated to Accepted.";
                } else {
                    updateApplicationStatus(connection, studentId, "Rejected");
                    statusUpdateMessage = "Applicant does not meet course requirements for desired major. Status updated to Rejected.";
                }
            } else {
                statusUpdateMessage = "Application status is not new; no action taken.";
            }

            resultArea.setText("Application Status: " + applicationStatus + "\n" +
                               "Eligibility Check: " + (isEligible ? "Eligible" : "Not Eligible") + "\n" +
                               statusUpdateMessage);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(frame, "Failed to connect to the database");
            ex.printStackTrace();
        }
    }

    private static String getApplicantStatus(Connection connection, int studentId) throws SQLException {
        String status = null;
        String sql = "SELECT ApplicationStatus FROM Students WHERE StudentID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, studentId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    status = resultSet.getString("ApplicationStatus");
                }
            }
        }
        return status;
    }

    private static boolean checkEligibility(Connection connection, int studentId) throws SQLException {
        boolean isEligible = false;

        int majorID = MajorIDForStudent(connection, studentId);
        String sql = "SELECT COUNT(DISTINCT cr.CourseID) AS RequiredCourses, " +
                     "(SELECT COUNT(*) FROM StudentCourses sc WHERE sc.StudentID = ? AND sc.CourseID IN " +
                     "(SELECT cr.CourseID FROM CourseRequirements cr WHERE cr.MajorID = ?)) AS CompletedCourses " +
                     "FROM CourseRequirements cr WHERE cr.MajorID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, studentId);
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

    private static int MajorIDForStudent(Connection connection, int studentId) throws SQLException {
        int majorID = 0;
        String sql = "SELECT MajorID FROM StudentPrograms WHERE StudentID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, studentId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    majorID = resultSet.getInt("MajorID");
                }
            }
        }
        return majorID;
    }

    private static void updateApplicationStatus(Connection connection, int studentId, String newStatus) throws SQLException {
        String sql = "UPDATE Students SET ApplicationStatus = ? WHERE StudentID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, newStatus);
            statement.setInt(2, studentId);
            statement.executeUpdate();
        }
    }
}
