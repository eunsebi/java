package com.eunsebi.macro.view.panel;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTextField;

import com.eunsebi.macro.main.Main;

public class BottomPanel extends JPanel{
	JButton btn_a001, btn_a002, btn_a003, btn_a004, btn_a005, btn_a006, btn_a007, btn_a008,
			btn_a009, btn_a010, btn_a011, btn_a012, btn_a013;
	JButton btn_a101, btn_a102, btn_a103, btn_a104, btn_a105;
	JButton btn_a301, btn_a302, btn_a303, btn_a304, btn_a305, btn_a306;
	JLabel lbl_a001, lbl_a101, lbl_a102, lbl_a103, lbl_a201, lbl_a301, lbl_a302;
	JSpinner spinner;
	JPanel panel;
	JScrollPane scrollPane_a101, scrollPane_a102;
	JTextField textField_a101, textField_a102, textField_a103, textField_a104, textField_a301, textField_a302;
	
	public BottomPanel() {
		setLayout(null);
		
		JPanel bottom_panel = new JPanel();
		bottom_panel.setBounds(0, 0, 970, 50);
		add(bottom_panel);
		bottom_panel.setLayout(null);
		
		lbl_a201 = new JLabel("여 백 x");
		lbl_a201.setBounds(0, 4, 39, 15);
		bottom_panel.add(lbl_a201);
		
		btn_a301 = new JButton("게임화면 캡쳐 이미지");
		btn_a301.setBounds(0, 20, 149, 23);
		bottom_panel.add(btn_a301);
		
		btn_a302 = new JButton("이미지 결과 보기 및 수정");
		btn_a302.setBounds(161, 20, 169, 23);
		bottom_panel.add(btn_a302);
		
		btn_a303 = new JButton("사용법");
		btn_a303.setBounds(342, 20, 69, 23);
		bottom_panel.add(btn_a303);
		
		btn_a304 = new JButton("매크로 다운");
		btn_a304.setBounds(423, 20, 97, 23);
		bottom_panel.add(btn_a304);
		
		btn_a305 = new JButton("창 크게");
		btn_a305.setBounds(532, 20, 73, 23);
		bottom_panel.add(btn_a305);
		
		btn_a306 = new JButton("창 작게");
		btn_a306.setBounds(617, 20, 73, 23);
		bottom_panel.add(btn_a306);
		
		lbl_a301 = new JLabel("X : ");
		lbl_a301.setBounds(702, 24, 20, 15);
		bottom_panel.add(lbl_a301);
		
		textField_a301 = new JTextField();
		textField_a301.setBounds(726, 21, 100, 21);
		bottom_panel.add(textField_a301);
		textField_a301.setColumns(10);
		
		lbl_a302 = new JLabel("Y : ");
		lbl_a302.setBounds(838, 24, 20, 15);
		bottom_panel.add(lbl_a302);
		
		textField_a302 = new JTextField();
		textField_a302.setBounds(870, 21, 100, 21);
		bottom_panel.add(textField_a302);
		textField_a302.setColumns(10);
		
	}
}
