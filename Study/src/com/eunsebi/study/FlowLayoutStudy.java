package com.eunsebi.study;

import java.awt.Button;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.event.ActionEvent;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.awt.event.ActionListener;

@SuppressWarnings("serial")
public class FlowLayoutStudy extends Frame implements WindowListener {

	/*
	 * 1.프레임 만든다
	 * 2.배치(레이아웃)방법을 하나 정해서 프레임에 적용시킨다.
	 * 3.프레임에 버튼을 붙인다.
	 * 4.x누르면 프레임 닫히는 기능을 add
	 */

	public FlowLayoutStudy() {// 생성자 메서드
		// 객체를 만들어서 메모리에 찍는 소스가 숨어 있어요

		// 내가 프레임이다.this= new Frame();
		// this란 : 내 자신 클래스의 객체를 가리킴.
		this.setName("내가 프레임이다.");
		this.setSize(300, 200);

		// 3
		Button button1 = new Button("버튼 1");
		Button button2 = new Button("버튼 2");
		Button button3 = new Button("버튼 3");
		Button button4 = new Button("버튼 4");
		Button button5 = new Button("버튼 5");
		Button button6 = new Button("버튼 6");
		add(button1);
		add(button2);
		add(button3);
		add(button4);
		add(button5);
		add(button6);

		// ActionListener 객체 생성
		ButtonListener btnListener = new ButtonListener(this);
		button1.addActionListener(btnListener);
		button2.addActionListener(btnListener);
		button3.addActionListener(btnListener);
		button4.addActionListener(btnListener);
		button5.addActionListener(btnListener);
		button6.addActionListener(btnListener);

		// 2
		FlowLayout layout = new FlowLayout();
		this.setLayout(layout);

		// 4//WindowListener를 상속 받은 객체를 매게변수로 넣어줘야 함
		this.addWindowListener(this);
		this.setVisible(true);
	}

	// 버튼을 누르면 실행 되는 리스너 만들기
	class ButtonListener implements ActionListener {
		Frame frame;

		public ButtonListener(Frame f) {
			frame = f;
		}

		@Override
		public void actionPerformed(ActionEvent e) {
			String command = e.getActionCommand();
			System.out.println(command + "버튼을 눌렀다.");

			if (command.equals("버튼 1")) {
				frame.setBackground(Color.BLUE);
			} else if (command.equals("버튼 2")) {
				frame.setBackground(Color.RED);
			} else if (command.equals("버튼 3")) {
				frame.setBackground(Color.GREEN);
			} else if (command.equals("버튼 4")) {
				frame.setBackground(Color.YELLOW);
			} else if (command.equals("버튼 5")) {
				frame.setBackground(Color.BLACK);
			}
		}
	}

	public static void main(String[] args) {
		new FlowLayoutStudy();
	}

	// 4
	@Override
	public void windowClosing(WindowEvent arg0) {
		System.out.println("windowClosing");
		this.dispose();
		System.exit(0);
	}

	@Override
	public void windowActivated(WindowEvent e) {
		System.out.println("windowActivated");
	}

	public void windowClosed(WindowEvent e) {
		System.out.println("windowClosed");
	}

	public void windowDeactivated(WindowEvent e) {
		System.out.println("windowDeactivated");
	}

	public void windowDeiconified(WindowEvent e) {
		System.out.println("windowDeiconified");
	}

	public void windowIconified(WindowEvent e) {
		System.out.println("windowIconified");
	}

	public void windowOpened(WindowEvent e) {
		System.out.println("windowOpened");
	}
}
// component(버튼 등등).addEventListener
// frame(화면 창).addWindowListener
