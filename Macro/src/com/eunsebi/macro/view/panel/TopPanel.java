package com.eunsebi.macro.view.panel;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JSpinner;

import com.eunsebi.macro.Handler.buttonHandler;


public class TopPanel extends JPanel {
	
	private static final long serialVersionUID = 1L;
	JButton btn_a001, btn_a002, btn_a003, btn_a004, btn_a005, btn_a006, btn_a007, btn_a008,
			btn_a009, btn_a010, btn_a011, btn_a012, btn_a013;
	JLabel lbl_a001;
	JSpinner spinner;
	
	MainMenu mainMenu;
	DevicePanel devicePanel = new DevicePanel();
	JPanel menu_panel = new JPanel();
	
	public TopPanel() {
		
		setLayout(null);
		
		menu_panel.setBounds(0, 0, 980, 30);
		add(menu_panel);
		menu_panel.setLayout(null);
		
		btn_a001 = new JButton("디바이스 선택");
		btn_a001.setBounds(14, 5, 120, 23);
		menu_panel.add(btn_a001);
		
		btn_a002 = new JButton("게임 설정");
		btn_a002.setBounds(136, 5, 120, 23);
		buttonHandler buttonHandler = new buttonHandler();
		btn_a002.addActionListener(buttonHandler);
		menu_panel.add(btn_a002);
		
		btn_a003 = new JButton("로그");
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
		
	}
}
