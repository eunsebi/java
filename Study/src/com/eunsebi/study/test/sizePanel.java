package com.eunsebi.study.test;

import java.awt.GridLayout;

import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.border.Border;

public class sizePanel extends JPanel {

	public sizePanel() {
		JPanel sp = new JPanel(new GridLayout(3, 1));
		ButtonGroup bg = new ButtonGroup();
		JRadioButton smallButton = new JRadioButton("Small");
		JRadioButton mediumButton = new JRadioButton("Medium");
		JRadioButton largeButton = new JRadioButton("Large");

		sp.setSize(200, 200);
		sp.add(smallButton);
		bg.add(smallButton);
		sp.add(mediumButton);
		bg.add(mediumButton);
		sp.add(largeButton);
		bg.add(largeButton);

		Border etched = BorderFactory.createEtchedBorder();
		Border titled = BorderFactory.createTitledBorder(etched, "Size");
		sp.setBorder(titled);
		setVisible(true);
	}
}
