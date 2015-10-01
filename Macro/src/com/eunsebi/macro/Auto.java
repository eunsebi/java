package com.eunsebi.macro;

import java.awt.Color;
import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTextField;

@SuppressWarnings("serial")
public class Auto extends JFrame implements ActionListener{
	private final JButton button = new JButton("디바이스 선택");
	private JTextField textField;
	private JTextField textField_1;
	private JTextField textField_2;
	private JTextField textField_3;
	private JTextField textField_4;
	private JTextField textField_5;
	
	public Auto() {
		setBounds(250, 100, 1000, 370); // (x좌표, y좌표, 너비, 높이)
		setTitle("러스트 블러스 매크로");
		getContentPane().setLayout(null);
		button.setBounds(0, 0, 120, 25);
		getContentPane().add(button);
		
		JButton btnNewButton = new JButton("게임 설정");
		btnNewButton.setBounds(120, 0, 100, 25);
		getContentPane().add(btnNewButton);
		
		JButton button_1 = new JButton("로그");
		button_1.setBounds(220, 0, 70, 25);
		getContentPane().add(button_1);
		
		JButton button_2 = new JButton("기타");
		button_2.setBounds(290, 0, 70, 25);
		getContentPane().add(button_2);
		
		JButton button_3 = new JButton("시작");
		button_3.setBounds(370, 0, 70, 25);
		getContentPane().add(button_3);
		
		JButton button_4 = new JButton("정지");
		button_4.setBounds(440, 0, 70, 25);
		getContentPane().add(button_4);
		
		JButton button_5 = new JButton("게임 설정 저장");
		button_5.setBounds(510, 0, 120, 25);
		getContentPane().add(button_5);
		
		JButton button_6 = new JButton("게임 설정 로드");
		button_6.setBounds(630, 0, 120, 25);
		getContentPane().add(button_6);
		
		JButton button_7 = new JButton("게임 크기 복원");
		button_7.setBounds(750, 0, 120, 25);
		getContentPane().add(button_7);
		
		JLabel lblNewLabel = new JLabel("숨기기");
		lblNewLabel.setBounds(870, 0, 40, 25);
		getContentPane().add(lblNewLabel);
		
		JSpinner spinner = new JSpinner();
		spinner.setBounds(910, 2, 29, 22);
		getContentPane().add(spinner);
		
		JButton btnNewButton_1 = new JButton("");
		btnNewButton_1.setBounds(940, 0, 20, 12);
		getContentPane().add(btnNewButton_1);
		
		JButton button_8 = new JButton("");
		button_8.setBounds(940, 13, 20, 12);
		getContentPane().add(button_8);
		
		JButton button_9 = new JButton("");
		button_9.setBounds(960, 0, 20, 12);
		getContentPane().add(button_9);
		
		JButton button_10 = new JButton("");
		button_10.setBounds(960, 13, 20, 12);
		getContentPane().add(button_10);
		
		JLabel lblNewLabel_1 = new JLabel("디바이스 목록");
		lblNewLabel_1.setBounds(10, 30, 100, 15);
		getContentPane().add(lblNewLabel_1);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 50, 700, 160);
		getContentPane().add(scrollPane);
		
		textField = new JTextField();
		scrollPane.setViewportView(textField);
		textField.setBackground(Color.LIGHT_GRAY);
		textField.setColumns(10);
		
		JLabel label = new JLabel("원드 / 블택 목록");
		label.setBounds(720, 30, 100, 15);
		getContentPane().add(label);
		
		JScrollPane scrollPane_1 = new JScrollPane();
		scrollPane_1.setBounds(720, 50, 250, 160);
		getContentPane().add(scrollPane_1);
		
		textField_1 = new JTextField();
		scrollPane_1.setViewportView(textField_1);
		textField_1.setBackground(Color.LIGHT_GRAY);
		textField_1.setColumns(10);
		
		JButton button_12 = new JButton("선  택");
		button_12.setBounds(590, 215, 120, 25);
		getContentPane().add(button_12);
		
		JButton button_11 = new JButton("검  색");
		button_11.setBounds(465, 215, 120, 25);
		getContentPane().add(button_11);
		
		JButton button_13 = new JButton("검 색");
		button_13.setBounds(720, 215, 80, 25);
		getContentPane().add(button_13);
		
		JButton button_14 = new JButton("연 결");
		button_14.setBounds(805, 215, 80, 25);
		getContentPane().add(button_14);
		
		JButton button_15 = new JButton("선 택");
		button_15.setBounds(890, 215, 80, 25);
		getContentPane().add(button_15);
		
		JLabel lblNewLabel_2 = new JLabel("선택된 디바이스");
		lblNewLabel_2.setBounds(10, 225, 100, 15);
		getContentPane().add(lblNewLabel_2);
		
		textField_2 = new JTextField();
		textField_2.setBounds(10, 245, 700, 21);
		getContentPane().add(textField_2);
		textField_2.setColumns(10);
		
		textField_3 = new JTextField();
		textField_3.setBounds(720, 245, 252, 21);
		getContentPane().add(textField_3);
		textField_3.setColumns(10);
		
		JLabel lblNewLabel_3 = new JLabel("여 백 x");
		lblNewLabel_3.setBounds(10, 276, 57, 15);
		getContentPane().add(lblNewLabel_3);
		
		JButton button_16 = new JButton("게임화면 캡쳐 이미지");
		button_16.setBounds(0, 300, 180, 25);
		getContentPane().add(button_16);
		
		JButton button_17 = new JButton("이미지 결과 보기 및 수정");
		button_17.setBounds(185, 300, 180, 25);
		getContentPane().add(button_17);
		
		JButton button_18 = new JButton("사용법");
		button_18.setBounds(393, 300, 110, 25);
		getContentPane().add(button_18);
		
		JButton button_19 = new JButton("매크로 다운");
		button_19.setBounds(505, 300, 110, 25);
		getContentPane().add(button_19);
		
		JButton button_20 = new JButton("창 크게");
		button_20.setBounds(617, 300, 110, 25);
		getContentPane().add(button_20);
		
		JButton button_21 = new JButton("창 작게");
		button_21.setBounds(730, 300, 100, 25);
		getContentPane().add(button_21);
		
		JLabel lblNewLabel_4 = new JLabel("X : ");
		lblNewLabel_4.setBounds(842, 300, 20, 25);
		getContentPane().add(lblNewLabel_4);
		
		JLabel lblY = new JLabel("Y : ");
		lblY.setBounds(915, 300, 20, 25);
		getContentPane().add(lblY);
		
		textField_4 = new JTextField();
		textField_4.setBounds(864, 300, 40, 25);
		getContentPane().add(textField_4);
		textField_4.setColumns(10);
		
		textField_5 = new JTextField();
		textField_5.setColumns(10);
		textField_5.setBounds(934, 300, 40, 25);
		getContentPane().add(textField_5);
		
		setResizable(false);									//창 크기 변경 못하게 막는다.
		setDefaultCloseOperation(EXIT_ON_CLOSE);				//X버튼 활성화 

		setVisible(true);										//frame을 화면에 나타나도록 설정
	}
	
	@Override
	public void actionPerformed(ActionEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	@SuppressWarnings("unused")
	private static void addPopup(Component component, final JPopupMenu popup) {
		component.addMouseListener(new MouseAdapter() {
			public void mousePressed(MouseEvent e) {
				if (e.isPopupTrigger()) {
					showMenu(e);
				}
			}
			public void mouseReleased(MouseEvent e) {
				if (e.isPopupTrigger()) {
					showMenu(e);
				}
			}
			private void showMenu(MouseEvent e) {
				popup.show(e.getComponent(), e.getX(), e.getY());
			}
		});
	}
	
	public static void main(String[] args) {
		new Auto();
	}
	
}

