import java.sql.Driver;
import java.sql.DriverManager;
import java.util.Enumeration;

public class Check {
    public static void main(String[] args) {
        try {
            // Attempt to load a specific JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("MySQL JDBC driver is installed.");
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC driver is not installed.");
        }

        // Check and list all registered JDBC drivers
        Enumeration<Driver> driverList = DriverManager.getDrivers();
        while (driverList.hasMoreElements()) {
            Driver driver = driverList.nextElement();
            System.out.println("Driver: " + driver.getClass().getName());
        }
    }
}

