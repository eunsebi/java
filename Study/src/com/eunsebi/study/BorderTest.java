package com.eunsebi.study;

import javax.swing.border.*;
import javax.swing.*;
import java.awt.*;

class BorderTest extends JFrame {
	int w = 280;
	int h = 40;
	int gap = 15;

	public BorderTest() {

		setBounds(100, 200, 630, 500);
		setLayout(null);
		setTitle("Border Example ( SEXY.PE.KR )");

		JPanel p = new JPanel();
		p.setBounds(gap, gap, w, h);
		p.setBorder(new BevelBorder(BevelBorder.RAISED));
		p.setLayout(new BorderLayout());
		p.add(new JLabel("BevelBorder(BevelBorder.RAISED)", JLabel.CENTER));
		add(p);

		JPanel p2 = new JPanel();
		p2.setBounds(gap * 2 + w, gap, w, h);
		p2.setBorder(new BevelBorder(BevelBorder.LOWERED));
		p2.setLayout(new BorderLayout());
		p2.add(new JLabel("BevelBorder(BevelBorder.LOWERED)", JLabel.CENTER));
		add(p2);

		JPanel p3 = new JPanel();
		p3.setBounds(gap, gap * 2 + h, w, h);
		p3.setBorder(new LineBorder(Color.red, 5));
		p3.setLayout(new BorderLayout());
		p3.add(new JLabel("LineBorder(Color.red,5)", JLabel.CENTER));
		add(p3);

		JPanel p4 = new JPanel();
		p4.setBounds(gap * 2 + w, gap * 2 + h, w, h);
		p4.setBorder(new EmptyBorder(5, 5, 5, 5));
		p4.setLayout(new BorderLayout());
		p4.add(new JLabel("EmptyBorder(5,5,5,5)", JLabel.CENTER));
		add(p4);

		JPanel p5 = new JPanel();
		p5.setBounds(gap, gap * 3 + h * 2, w, h);
		p5.setBorder(new EtchedBorder(EtchedBorder.RAISED));
		p5.setLayout(new BorderLayout());
		p5.add(new JLabel("EtchedBorder(EtchedBorder.RAISED)", JLabel.CENTER));
		add(p5);

		JPanel p6 = new JPanel();
		p6.setBounds(gap * 2 + w, gap * 3 + h * 2, w, h);
		p6.setBorder(new EtchedBorder(EtchedBorder.LOWERED));
		p6.setLayout(new BorderLayout());
		p6.add(new JLabel("EtchedBorder(EtchedBorder.LOWERED)", JLabel.CENTER));
		add(p6);

		JPanel p7 = new JPanel();
		p7.setBounds(gap, gap * 4 + h * 3, w, h);
		p7.setBorder(new SoftBevelBorder(SoftBevelBorder.RAISED));
		p7.setLayout(new BorderLayout());
		p7.add(new JLabel("SoftBevelBorder(SoftBevelBorder.RAISED)", JLabel.CENTER));
		add(p7);

		JPanel p8 = new JPanel();
		p8.setBounds(gap * 2 + w, gap * 4 + h * 3, w, h);
		p8.setBorder(new SoftBevelBorder(SoftBevelBorder.LOWERED));
		p8.setLayout(new BorderLayout());
		p8.add(new JLabel("SoftBevelBorder(SoftBevelBorder.LOWERED)", JLabel.CENTER));
		add(p8);

		JPanel p9 = new JPanel();
		p9.setBounds(gap, gap * 5 + h * 4, w * 2, h);
		p9.setBorder(new MatteBorder(new ImageIcon("line.png")));
		p9.setLayout(new BorderLayout());
		p9.add(new JLabel("MatteBorder(new ImageIcon(\"line.png\"))", JLabel.CENTER));
		add(p9);

		JPanel p10 = new JPanel();
		p10.setBounds(gap, gap * 6 + h * 5, w * 2, h);
		p10.setBorder(new TitledBorder(new LineBorder(Color.blue, 5), "TITLE"));
		p10.setLayout(new BorderLayout());
		p10.add(new JLabel("TitledBorder(new LineBorder(Color.blue,5),\"TITLE\")", JLabel.CENTER));
		add(p10);

		JPanel p11 = new JPanel();
		p11.setBounds(gap, gap * 7 + h * 6, w * 2, h);
		p11.setBorder(new TitledBorder(new EmptyBorder(5, 5, 5, 5), "TITLE"));
		p11.setLayout(new BorderLayout());
		p11.add(new JLabel("TitledBorder(new EmptyBorder(5,5,5,5),\"TITLE\")", JLabel.CENTER));
		add(p11);

		JPanel p12 = new JPanel();
		p12.setBounds(gap, gap * 8 + h * 7, w * 2, h);
		p12.setBorder(new TitledBorder(new MatteBorder(new ImageIcon("line.png")), "TITLE"));
		p12.setLayout(new BorderLayout());
		p12.add(new JLabel("TitledBorder(new MatteBorder(new ImageIcon(\"line.png\")),\"TITLE\")", JLabel.CENTER));
		add(p12);

		setVisible(true);
	}

	public static void main(String[] args) {
		new BorderTest();
	}
}
