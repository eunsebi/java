package com.eunsebi.study;

import java.awt.Button;
import java.awt.Frame;
import java.awt.Label;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AWT_Text extends Frame implements ActionListener {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Label[] lbl = new Label[5];
	TextField[] tf = new TextField[5];
	String[] title = { "아이디", "비밀번호", "이름", "나이", "전화번호" };
	TextArea ta;
	Label lbl_ta;
	Button btn_submit;

	AWT_Text() {
		setBounds(100, 100, 500, 400);
		setTitle("Text 박스 이용하기");
		setLayout(null);

		for (int i = 0; i < lbl.length; i++) {
			lbl[i] = new Label(title[i], Label.RIGHT);
			lbl[i].setBounds(0, (i * 28) + 40, 70, 25);

			tf[i] = new TextField();
			tf[i].setBounds(80, (i * 28) + 40, 150, 25);

			add(lbl[i]);
			add(tf[i]);
		}
		tf[1].setEchoChar('*');

		lbl_ta = new Label("입력 결과");
		lbl_ta.setBounds(10, 180, 200, 20);
		ta = new TextArea("", 0, 0, TextArea.SCROLLBARS_NONE);
		ta.setBounds(10, 200, 480, 140);
		btn_submit = new Button("확인");
		btn_submit.setBounds(410, 350, 80, 30);

		btn_submit.addActionListener(this);

		add(lbl_ta);
		add(ta);
		add(btn_submit);

		setVisible(true);

	}

	public static void main(String[] args) {
		new AWT_Text();
	}

	@Override

	public void actionPerformed(ActionEvent arg0) {
		ta.setText("");
		for (int i = 0; i < tf.length; i++) {
			ta.append("입력한 " + title[i] + "\t" + tf[i].getText() + "\n");
		}
	}

}
