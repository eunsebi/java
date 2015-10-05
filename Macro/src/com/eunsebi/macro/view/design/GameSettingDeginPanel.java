package com.eunsebi.macro.view.design;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JLayeredPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTextField;

import com.eunsebi.macro.asset.Setting;
import com.eunsebi.macro.main.Main;
import javax.swing.SwingConstants;
import java.awt.Color;
import java.awt.Label;
import java.awt.Panel;
import java.awt.Checkbox;
import java.awt.Button;
import javax.swing.JComboBox;
import javax.swing.JList;
import javax.swing.JMenuItem;

public class GameSettingDeginPanel extends JFrame implements ActionListener{
	JButton btn_a001, btn_a002, btn_a003, btn_a004, btn_a005, btn_a006, btn_a007, btn_a008, btn_a009, btn_a010, btn_a011, btn_a012, btn_a013;
	JButton btn_a101, btn_a102, btn_a103, btn_a104, btn_a105;
	JButton btn_a301, btn_a302, btn_a303, btn_a304, btn_a305, btn_a306;
	JLabel lbl_a001, lbl_a101, lbl_a102, lbl_a103, lbl_a201, lbl_a301, lbl_a302;
	JSpinner spinner;
	JPanel panel;
	JScrollPane scrollPane_a101, scrollPane_a102;
	JTextField textField_a101, textField_a102, textField_a103, textField_a104, textField_a301, textField_a302;
	Main main;

	public JLayeredPane layeredPane = new JLayeredPane();

	JPanel menu_panel = new JPanel();
	JPanel body_panel = new JPanel();
	JPanel bottom_panel = new JPanel();
	JPanel gameSetting_panel = new JPanel();
	private JLabel lblNewLabel;
	private Label label_1;
	private JSpinner spinner_2;
	private JLabel label_2;
	private Label label_3;
	private Panel panel_2;
	private Label label_4;

	public GameSettingDeginPanel() {
		getContentPane().setLayout(null);
		setTitle("러스트블러드 매크로");
		setSize(Setting.bDimen);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setLocation(Setting.locationX, Setting.locationY);

		//add(setJLayered(topPanel, devicePanel, bottomPanel));
		//add(mainPanel);
		//add(layeredPane);
		/*
		 * add(topPanel); add(devicePanel); add(bottomPanel);
		 */

		menu_panel.setBounds(0, 0, 980, 30);
		getContentPane().add(menu_panel);
		menu_panel.setLayout(null);

		btn_a001 = new JButton("디바이스 선택");
		btn_a001.setFont(new Font("굴림체", Font.BOLD, 10));
		btn_a001.setBounds(14, 5, 120, 23);
		menu_panel.add(btn_a001);

		btn_a002 = new JButton("게임 설정");
		btn_a002.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				System.out.println("마우스 클릭");
				body_panel.setVisible(false);
				gameSetting_panel.setVisible(true);
			}
		});
		btn_a002.setBounds(136, 5, 120, 23);
		menu_panel.add(btn_a002);

		btn_a003 = new JButton("로그");
		btn_a003.setFont(new Font("굴림", Font.PLAIN, 10));
		btn_a003.setBounds(261, 5, 57, 23);
		menu_panel.add(btn_a003);

		btn_a004 = new JButton("기타");
		btn_a004.setBounds(320, 5, 57, 23);
		menu_panel.add(btn_a004);

		btn_a005 = new JButton("시작");
		btn_a005.setBounds(384, 5, 57, 23);
		menu_panel.add(btn_a005);

		btn_a006 = new JButton("정지");
		btn_a006.setBounds(441, 5, 57, 23);
		menu_panel.add(btn_a006);

		btn_a007 = new JButton("게임 설정 저장");
		btn_a007.setBounds(500, 5, 113, 23);
		menu_panel.add(btn_a007);

		btn_a008 = new JButton("게임 설정 로드");
		btn_a008.setBounds(615, 5, 113, 23);
		menu_panel.add(btn_a008);

		btn_a009 = new JButton("게임 크기 복원");
		btn_a009.setBounds(730, 5, 113, 23);
		menu_panel.add(btn_a009);

		lbl_a001 = new JLabel("숨기기");
		lbl_a001.setBounds(850, 9, 36, 15);
		menu_panel.add(lbl_a001);

		spinner = new JSpinner();
		spinner.setBounds(893, 5, 29, 22);
		menu_panel.add(spinner);

		btn_a010 = new JButton("");
		btn_a010.setBounds(924, 4, 25, 12);
		menu_panel.add(btn_a010);

		btn_a011 = new JButton("");
		btn_a011.setBounds(950, 4, 25, 12);
		menu_panel.add(btn_a011);

		btn_a012 = new JButton("");
		btn_a012.setBounds(924, 17, 25, 12);
		menu_panel.add(btn_a012);

		btn_a013 = new JButton("");
		btn_a013.setBounds(950, 17, 25, 12);
		menu_panel.add(btn_a013);
		
		// body
		gameSetting_panel.setBounds(10, 30, 970, 240);
		getContentPane().add(gameSetting_panel);
		gameSetting_panel.setLayout(null);
		
		Panel panel_1 = new Panel();
		panel_1.setBackground(Color.ORANGE);
		panel_1.setBounds(0, 0, 160, 240);
		gameSetting_panel.add(panel_1);
		panel_1.setLayout(null);
		
		Label label = new Label("주기");
		label.setBounds(0, 0, 160, 25);
		panel_1.add(label);
		label.setAlignment(Label.CENTER);
		label.setBackground(Color.RED);
		
		JSpinner spinner_1 = new JSpinner();
		spinner_1.setBounds(10, 26, 70, 25);
		panel_1.add(spinner_1);
		
		lblNewLabel = new JLabel("ms");
		lblNewLabel.setBounds(85, 26, 70, 25);
		panel_1.add(lblNewLabel);
		
		label_1 = new Label("중복 접속 대기시간");
		label_1.setBackground(Color.RED);
		label_1.setAlignment(Label.CENTER);
		label_1.setBounds(0, 51, 160, 25);
		panel_1.add(label_1);
		
		spinner_2 = new JSpinner();
		spinner_2.setBounds(10, 76, 70, 25);
		panel_1.add(spinner_2);
		
		label_2 = new JLabel("분후 재접속");
		label_2.setBounds(85, 76, 70, 25);
		panel_1.add(label_2);
		
		label_3 = new Label("1로테이션 선택");
		label_3.setBackground(Color.RED);
		label_3.setAlignment(Label.CENTER);
		label_3.setBounds(0, 101, 160, 25);
		panel_1.add(label_3);
		
		Checkbox checkbox = new Checkbox("스토리");
		checkbox.setBounds(5, 127, 70, 20);
		panel_1.add(checkbox);
		
		Checkbox checkbox_1 = new Checkbox("진보스");
		checkbox_1.setBounds(80, 127, 70, 20);
		panel_1.add(checkbox_1);
		
		Checkbox checkbox_2 = new Checkbox("고브");
		checkbox_2.setBounds(5, 145, 70, 20);
		panel_1.add(checkbox_2);
		
		Checkbox checkbox_3 = new Checkbox("길드사냥");
		checkbox_3.setBounds(80, 145, 70, 20);
		panel_1.add(checkbox_3);
		
		Checkbox checkbox_5 = new Checkbox("데쓰매치");
		checkbox_5.setBounds(80, 163, 70, 20);
		panel_1.add(checkbox_5);
		
		Checkbox checkbox_6 = new Checkbox("명예의전당");
		checkbox_6.setBounds(5, 195, 100, 20);
		panel_1.add(checkbox_6);
		
		Checkbox checkbox_7 = new Checkbox("우편함");
		checkbox_7.setBounds(5, 213, 70, 20);
		panel_1.add(checkbox_7);
		
		Checkbox checkbox_8 = new Checkbox("친구");
		checkbox_8.setBounds(80, 213, 70, 20);
		panel_1.add(checkbox_8);
		
		panel_2 = new Panel();
		panel_2.setBounds(160, 0, 810, 25);
		gameSetting_panel.add(panel_2);
		panel_2.setLayout(null);
		
		Button button = new Button("시퀸스/기타설정");
		button.setBounds(10, 0, 130, 25);
		panel_2.add(button);
		
		Button button_1 = new Button("스토리");
		button_1.setBounds(140, 0, 130, 25);
		panel_2.add(button_1);
		
		Button button_2 = new Button("진보스/고브소굴");
		button_2.setBounds(270, 0, 130, 25);
		panel_2.add(button_2);
		
		Button button_3 = new Button("길드사냥/데스매치");
		button_3.setBounds(400, 0, 130, 25);
		panel_2.add(button_3);
		
		JPanel panel_3 = new JPanel();
		panel_3.setBounds(160, 25, 810, 215);
		gameSetting_panel.add(panel_3);
		panel_3.setLayout(null);
		
		JList list = new JList();
		list.setBounds(12, 35, 83, 170);
		panel_3.add(list);
		
		label_4 = new Label("1로테이션 순서 설정");
		label_4.setAlignment(Label.CENTER);
		label_4.setForeground(Color.WHITE);
		label_4.setBackground(Color.RED);
		label_4.setBounds(0, 0, 212, 37);
		panel_3.add(label_4);
	}

	@Override
	public void actionPerformed(ActionEvent arg0) {
		// TODO Auto-generated method stub
		
	}
}
