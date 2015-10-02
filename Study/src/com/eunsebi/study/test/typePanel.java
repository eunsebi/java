package com.eunsebi.study.test;

import java.awt.GridLayout;

import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.border.Border;

public class typePanel extends JPanel {
	public typePanel() {
		JPanel typePanel = new JPanel(new GridLayout(3, 1));
		ButtonGroup bg = new ButtonGroup();
		JRadioButton regularButton = new JRadioButton("Regular");
		JRadioButton decafButton = new JRadioButton("Decaf");
		JRadioButton frenchRoastButton = new JRadioButton("French Roast");

		typePanel.setSize(200, 200);
		typePanel.add(regularButton);
		bg.add(regularButton);
		typePanel.add(decafButton);
		bg.add(decafButton);
		typePanel.add(frenchRoastButton);
		bg.add(frenchRoastButton);

		Border etched = BorderFactory.createEtchedBorder();
		Border titled = BorderFactory.createTitledBorder(etched, "Type");
		typePanel.setBorder(titled);
		setVisible(true);
	}
}