package com.eunsebi.macro.view.panel;

import java.awt.Color;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTextField;

import com.eunsebi.macro.main.Main;

public class DevicePanel extends JPanel {

	JButton btn_a001, btn_a002, btn_a003, btn_a004, btn_a005, btn_a006, btn_a007, btn_a008, btn_a009, btn_a010, btn_a011, btn_a012, btn_a013;
	JButton btn_a101, btn_a102, btn_a103, btn_a104, btn_a105;
	JButton btn_a301, btn_a302, btn_a303, btn_a304, btn_a305, btn_a306;
	JLabel lbl_a001, lbl_a101, lbl_a102, lbl_a103, lbl_a201, lbl_a301, lbl_a302;
	JSpinner spinner;
	JPanel panel;
	JScrollPane scrollPane_a101, scrollPane_a102;
	JTextField textField_a101, textField_a102, textField_a103, textField_a104, textField_a301, textField_a302;

	public DevicePanel() {
		setLayout(null);

		// 패널부 시작
		JPanel body_panel = new JPanel();

		body_panel.setBounds(0, 0, 970, 240);
		add(body_panel);
		body_panel.setLayout(null);

		lbl_a101 = new JLabel("디바이스 목록");
		lbl_a101.setBounds(0, 0, 100, 15);
		body_panel.add(lbl_a101);

		scrollPane_a101 = new JScrollPane();
		scrollPane_a101.setBounds(5, 20, 700, 160);
		body_panel.add(scrollPane_a101);

		textField_a101 = new JTextField();
		scrollPane_a101.setViewportView(textField_a101);
		textField_a101.setBackground(Color.LIGHT_GRAY);
		textField_a101.setColumns(10);

		lbl_a102 = new JLabel("원드 / 블택 목록");
		lbl_a102.setBounds(710, 0, 100, 15);
		body_panel.add(lbl_a102);

		scrollPane_a102 = new JScrollPane();
		scrollPane_a102.setBounds(710, 20, 250, 160);
		body_panel.add(scrollPane_a102);

		textField_a102 = new JTextField();
		scrollPane_a102.setViewportView(textField_a102);
		textField_a102.setBackground(Color.LIGHT_GRAY);
		textField_a102.setColumns(10);

		btn_a101 = new JButton("검  색");
		btn_a101.setBounds(300, 185, 200, 25);
		body_panel.add(btn_a101);

		btn_a102 = new JButton("선  택");
		btn_a102.setBounds(505, 185, 200, 25);
		body_panel.add(btn_a102);

		btn_a103 = new JButton("검 색");
		btn_a103.setBounds(710, 185, 80, 25);
		body_panel.add(btn_a103);

		btn_a104 = new JButton("연 결");
		btn_a104.setBounds(795, 185, 80, 25);
		body_panel.add(btn_a104);

		btn_a105 = new JButton("선 택");
		btn_a105.setBounds(880, 185, 80, 25);
		body_panel.add(btn_a105);

		lbl_a103 = new JLabel("선택된 디바이스");
		lbl_a103.setBounds(0, 195, 100, 15);
		body_panel.add(lbl_a103);

		textField_a103 = new JTextField();
		textField_a103.setBounds(5, 215, 700, 21);
		body_panel.add(textField_a103);
		textField_a103.setColumns(10);

		textField_a104 = new JTextField();
		textField_a104.setBounds(710, 215, 252, 21);
		body_panel.add(textField_a104);
		textField_a104.setColumns(10);
	}
}
