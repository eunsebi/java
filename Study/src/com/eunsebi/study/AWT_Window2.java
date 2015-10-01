package com.eunsebi.study;

import java.awt.Frame;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

@SuppressWarnings("serial")
public class AWT_Window2 extends Frame {
	AWT_Window2() {
		setBounds(200, 200, 500, 500);
		setTitle("윈도우창 제어하기2");

		this.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});

		setVisible(true);
	}

	public static void main(String[] args) {
		new AWT_Window2();
	}
}
