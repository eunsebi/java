package com.eunsebi.study;

import java.awt.Button;
import java.awt.Font;
import java.awt.Frame;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

@SuppressWarnings("serial")
public class AWT_Window extends Frame implements WindowListener, ActionListener {
	Frame f; // 새로 띄워지는 창
	Button btn; // 새창 띄우는 버튼
	Label lbl, lblStatus; // 상태를 표시하기위한 Label

	public AWT_Window() {
		// 기본 Frame 설정
		setBounds(100, 100, 300, 300);
		setLayout(null);
		setTitle("윈도우창 제어하기");

		// "현재 상태"라고 표시되는 method
		lbl = new Label("현재 상태");
		lbl.setFont(new Font("돋움", Font.BOLD, 20));
		lbl.setBounds(10, 50, 300, 50);

		// 상태를 표시해주는 Label
		lblStatus = new Label("안떠있음");
		lblStatus.setFont(new Font("돋움", Font.BOLD, 20));
		lblStatus.setBounds(100, 100, 200, 50);

		// 버튼의 크기/Text 설정
		btn = new Button("창 띄우기");
		btn.setBounds(0, 250, 300, 50);

		// 현재 프레임에 버튼과 Lable 추가
		add(btn);
		add(lbl);
		add(lblStatus);

		// 버튼의 이벤트를 처리해줄 리스너
		btn.addActionListener(this);
		setVisible(true);
	}

	// 새로운 창을 띄우는 Method
	public void crtFrame(String title) {
		// 생성된 Frame이 없을 때
		if (f == null) {
			// 새로 띄워질 Frame 설정
			f = new Frame();
			f.setBounds(400, 100, 300, 300);
			f.setTitle(title);
			f.addWindowListener(this);
			f.setVisible(true);
		}
	}

	// 잠시 대기하게 만드는 method
	public void sleep(int time) {
		try {
			Thread.sleep(time);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	// main
	public static void main(String[] args) {
		new AWT_Window();
	}

	@Override
	public void windowActivated(WindowEvent e) {
		// TODO Auto-generated method stub
		lblStatus.setText("활성화 상태");
		sleep(1000);
	}

	@Override
	public void windowClosed(WindowEvent e) {
		lblStatus.setText("닫혀짐");
		sleep(1000);
	}

	@Override
	public void windowClosing(WindowEvent e) {
		// TODO Auto-generated method stub
		lblStatus.setText("닫힘");
		sleep(1000);
		f.dispose();
		f = null;
	}

	@Override
	public void windowDeactivated(WindowEvent e) {
		lblStatus.setText("비활성화 상태");
		sleep(1000);
	}

	@Override
	public void windowDeiconified(WindowEvent e) {
		lblStatus.setText("최소화 상태에서 다시 원래대로");
		sleep(1000);
	}

	@Override
	public void windowIconified(WindowEvent e) {
		lblStatus.setText("최소화 상태");
		sleep(1000);
	}

	@Override
	public void windowOpened(WindowEvent e) {
		lblStatus.setText("열림");
		sleep(1000);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// 버튼 클릭했을때의 이벤트
		crtFrame("새창");
	}
}
