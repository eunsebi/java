package com.eunsebi.study.test;

import java.awt.GridLayout;
import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.border.Border;

public class productsPanel extends JPanel {
	public productsPanel() {
		JPanel productPanel = new JPanel(new GridLayout(3, 1));
		ButtonGroup bg = new ButtonGroup();
		JRadioButton coffeeButton = new JRadioButton("Coffee");
		JRadioButton bagelButton = new JRadioButton("Bagel");
		JRadioButton pastryButton = new JRadioButton("Pastry");

		productPanel.setSize(150, 780);
		productPanel.add(coffeeButton);
		bg.add(coffeeButton);
		productPanel.add(bagelButton);
		bg.add(bagelButton);
		productPanel.add(pastryButton);
		bg.add(pastryButton);

		Border etched = BorderFactory.createEtchedBorder();
		Border titled = BorderFactory.createTitledBorder(etched, "Products");
		productPanel.setBorder(titled);
		setVisible(true);
	}
}