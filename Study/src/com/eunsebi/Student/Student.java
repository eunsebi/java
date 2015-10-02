package com.eunsebi.Student;

import java.awt.Button;

import java.awt.Color;

import java.awt.Dimension;

import java.awt.Font;

import java.awt.GridLayout;

import java.awt.Label;

import java.awt.Panel;

import java.awt.TextArea;

import java.awt.TextField;

import java.awt.Toolkit;

import java.awt.event.ActionEvent;

import java.awt.event.ActionListener;

import java.awt.event.WindowAdapter;

import java.awt.event.WindowEvent;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.sql.Statement;

import javax.swing.JFrame;

public class Student extends WindowAdapter implements ActionListener {

	int studentNumber;

	String passWord, name;

	String url = "jdbc:oracle:thin:@127.0.0.1:1521:ORCL";

	String user = "KIM";

	String pwd = "YS";

	PreparedStatement stmt;

	ResultSet rs;

	TextField studentNumberTF, nameTF, passWordTF;

	TextArea mainArea;

	Connection conn;

	void driverLoding() {

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");

		} catch (ClassNotFoundException e) {

			e.printStackTrace();

		}

	}

	Connection getConnection() {

		try {

			conn = DriverManager.getConnection(url, user, pwd);

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return conn;

	}

	void close() {

		if (stmt != null)

			try {

				stmt.close();

			} catch (SQLException e) {

				e.printStackTrace();

			}

		if (rs != null)

			try {

				rs.close();

			} catch (SQLException e) {

				e.printStackTrace();

			}

	}

	public Student() {

		driverLoding();

		getConnection();

		JFrame f = new JFrame("Login"); // 패널만들기

		Panel center = new Panel();

		Panel south = new Panel();

		Panel information = new Panel();

		Panel button = new Panel();

		mainArea = new TextArea(40, 80);

		Button insert, update, delete, show;

		f.setSize(600, 800);

		Toolkit tk = Toolkit.getDefaultToolkit();

		Dimension screenSize = tk.getScreenSize();

		f.setLocation(screenSize.width / 2 - 300, screenSize.height / 2 - 400);

		Label l = new Label("Student Management");

		l.setFont(new Font("Dialog", Font.BOLD, 20));

		l.setAlignment(Label.CENTER);

		mainArea.setBackground(Color.black);

		mainArea.setForeground(Color.WHITE);

		center.add(mainArea);

		south.setLayout(new GridLayout(1, 2, 10, 0));

		information.setLayout(new GridLayout(3, 2, 0, 5));

		south.add(information);

		south.add(button);

		information.add(new Label("number"));

		information.add(studentNumberTF = new TextField());

		information.add(new Label("name"));

		information.add(nameTF = new TextField());

		information.add(new Label("PW"));

		information.add(passWordTF = new TextField());

		button.setLayout(new GridLayout(2, 2, 8, 8));

		button.add(insert = new Button("Insert"));

		button.add(update = new Button("Update"));

		button.add(delete = new Button("Delete"));

		button.add(show = new Button("Show"));

		insert.addActionListener(this);

		update.addActionListener(this);

		delete.addActionListener(this);

		show.addActionListener(this);

		f.addWindowListener(new WindowAdapter() {

			public void windowClosing(WindowEvent e) {

				close();

				System.exit(0);

			}

		});

		f.add(l, "North");

		f.add(center, "Center");

		f.add(south, "South");

		f.setVisible(true);

	}

	public static void main(String[] args) {

		Student stu = new Student();

	}

	public void actionPerformed(ActionEvent e) {

		if (studentNumberTF.getText() != null

		&& !studentNumberTF.getText().equals("")) {

			studentNumber = Integer.parseInt(studentNumberTF.getText());

		}

		passWord = passWordTF.getText();

		name = nameTF.getText();

		String command = e.getActionCommand();

		if (command == "Insert") {

			try {

				stmt = conn

				.prepareStatement("insert into student values(?,?,?)");

				stmt.setInt(1, studentNumber);

				stmt.setString(2, name);

				stmt.setString(3, passWord);

				stmt.executeUpdate();

			} catch (SQLException e1) {

				// TODO Auto-generated catch block

				e1.printStackTrace();

			}

			mainArea.append(studentNumber + "학번 정보 입력\n");

		} else if (command == "Delete") {

			String del = "delete from student where schoolnumber = "

			+ studentNumber;

			try {

				stmt = conn.prepareStatement(del);

				stmt.executeUpdate();

			} catch (SQLException e1) {

				// TODO Auto-generated catch block

				e1.printStackTrace();

			}

			mainArea.append(studentNumber + "학번 정보 삭제\n");

		} else if (command == "Update") {

			String change = "update student set name = '" + name

			+ "', password = '" + passWord + "' where schoolnumber = "

			+ studentNumber;

			try {

				stmt = conn.prepareStatement(change);

				stmt.executeUpdate();

			} catch (SQLException e1) {

				// TODO Auto-generated catch block

				e1.printStackTrace();

			}

			mainArea.append(studentNumber + "학번 정보 수정\n");

		} else if (command == "Show") {

			Statement log;

			try {

				log = conn.createStatement();

				ResultSet rs = log.executeQuery("select * from student");

				while (rs.next()) {

					mainArea.append(rs.getInt("schoolnumber") + "-"

					+ rs.getString("name") + "-"

					+ rs.getString("password") + "\n");

				}

			} catch (SQLException e1) {

				// TODO Auto-generated catch block

				e1.printStackTrace();

			}

		}

	}

}
