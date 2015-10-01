package com.eunsebi.study;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JTextArea;

@SuppressWarnings("serial")
public class EventTest extends JFrame implements ActionListener {
	JTextArea ta;
	JButton button_top, button_bot;

	public EventTest() {
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setSize(400, 300);
		this.setVisible(true);

		ta = new JTextArea();

		button_top = new JButton("클릭");
		button_bot = new JButton("클릭");
		button_top.addActionListener(this);
		button_bot.addActionListener(this);

		add(ta);
		add("North", button_top);
		add("South", button_bot);
	}

	public static void main(String[] args) {
		new EventTest();
	}

	public void actionPerformed(ActionEvent e) {
		Object source = e.getSource();

		if (source == button_top)
			ta.append("윗쪽 버튼" + '\n');
		else if (source == button_bot)
			ta.append("아래쪽 버튼" + '\n');
	}
}
