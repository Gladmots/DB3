## Getting Started

Welcome to the VS Code Java world. Here is a guideline to help you get started to write Java code in Visual Studio Code.

## Folder Structure

The workspace contains two folders by default, where:

- `src`: the folder to maintain sources
- `lib`: the folder to maintain dependencies

Meanwhile, the compiled output files will be generated in the `bin` folder by default.

> If you want to customize the folder structure, open `.vscode/settings.json` and update the related settings there.

## Dependency Management

The `JAVA PROJECTS` view allows you to manage your dependencies. More details can be found [here](https://github.com/microsoft/vscode-java-dependency#manage-dependencies).

Requirements to run the code for the database

1. Ensure that JDK is installed on the system where you intend to compile and run the Java program.
2. Set up a MySQL database with the appropriate schema and tables as expected by the application.Ensure that the database server  is running and accessible.
3. Include the MySQL JDBC driver (mysql-connector-java) in the project's classpath.
4. Compile the ApplicationProcessor.java file using javac ApplicationProcessor.java. Run the compiled class using java ApplicationProcessor.
