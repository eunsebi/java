package com.eunsebi.macro.test;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Enumeration;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTextField;
import javax.swing.UIManager;
import javax.swing.plaf.FontUIResource;

import com.eunsebi.macro.Handler.buttonHandler;
import com.eunsebi.macro.asset.Setting;
import com.eunsebi.macro.view.panel.MainMenu;

public class MainMenuTest extends JFrame implements ActionListener{

	JButton btn_a001, btn_a002, btn_a003, btn_a004, btn_a005, btn_a006, btn_a007, btn_a008, btn_a009, btn_a010, btn_a011, btn_a012, btn_a013;
	JButton btn_a101, btn_a102, btn_a103, btn_a104, btn_a105;
	JButton btn_a301, btn_a302, btn_a303, btn_a304, btn_a305, btn_a306;
	JLabel lbl_a001, lbl_a101, lbl_a102, lbl_a103, lbl_a201, lbl_a301, lbl_a302;
	JSpinner spinner;
	JPanel panel;
	JScrollPane scrollPane_a101, scrollPane_a102;
	JTextField textField_a101, textField_a102, textField_a103, textField_a104, textField_a301, textField_a302;
	
	JPanel menu_panel = new JPanel();
	JPanel body_panel = new JPanel();
	JPanel bottom_panel = new JPanel();

	public MainMenuTest() {
		setLayout(null);
		setVisible(true);
		setTitle("러스트블러드 매크로");
		setSize(Setting.bDimen);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setLocation(Setting.locationX, Setting.locationY);
		
		menu_panel.setBounds(0, 0, 1000, 30);
		add(menu_panel);
		menu_panel.setLayout(null);

		btn_a001 = new JButton("디바이스 선택");
		btn_a001.setBounds(14, 5, 120, 23);
		menu_panel.add(btn_a001);

		btn_a002 = new JButton("게임 설정");
		btn_a002.setBounds(136, 5, 120, 23);
		//buttonHandler buttonHandler = new buttonHandler();
		btn_a002.addActionListener(this);
		menu_panel.add(btn_a002);

		btn_a003 = new JButton("로그");
		btn_a003.setBounds(261, 5, 57, 23);
		btn_a003.addActionListener(this);
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
		
		//body
		body_panel.setBounds(0, 30, 1000, 240);
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
		
		//bottom
		bottom_panel.setBounds(0, 260, 1000, 50);
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
		

		setVisible(true);
	}
	
	public static void main(String[] args) throws Exception {
		setUIFont(new FontUIResource(new Font("굴림체", Font.BOLD, 10)));

		MainMenuTest mainMenuTest = new MainMenuTest();
		//mainMenu.setRectangles(MainMenu.class, mainMenu, Setting.class, Setting.getInstance());
	}
	
	private static void setUIFont(FontUIResource f) {
		// TODO Auto-generated method stub
        Enumeration keys = UIManager.getDefaults().keys();
        while (keys.hasMoreElements()) {
            Object key = keys.nextElement();
            Object value = UIManager.get(key);
            if (value instanceof FontUIResource) {
                FontUIResource orig = (FontUIResource) value;
                Font font = new Font(f.getFontName(), orig.getStyle(), f.getSize());
                UIManager.put(key, new FontUIResource(font));
            }
        }
    }

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		System.out.println("버튼 클릭 액션 체크 됨 ");
		Object button = e.getSource();
		
		System.out.println("클릭 버튼 : " +button);
		if (button == btn_a002) {
			System.out.println("게임설정 버튼 클릭");
			body_panel.setVisible(false);
			bottom_panel.setVisible(false);
		} else if(button == btn_a003) {
			System.out.println("로그 클릭");
			body_panel.setVisible(true);
		}
		
	}
}
