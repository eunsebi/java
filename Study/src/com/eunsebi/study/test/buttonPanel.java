package com.eunsebi.study.test;

import java.awt.GridLayout;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JPanel;

public class buttonPanel extends JPanel {
	JButton enterItemButton;
	JPanel buttonPanel;
	ButtonGroup bg;
	JButton totalButton;
	JButton newOrderButton;

	public buttonPanel() {
		super(new GridLayout(1,3));
	    bg = new ButtonGroup();
	    enterItemButton = new JButton("Enter Item");
	    totalButton = new JButton("Total");
	    newOrderButton = new JButton("New Order");

	    this.setSize(150, 780);
	    this.add(enterItemButton);
	    bg.add(enterItemButton);
	    this.add(totalButton);
	    bg.add(totalButton);
	    this.add(newOrderButton);
	    bg.add(newOrderButton);
	    this.setVisible(true);

		/*buttonPanel = new JPanel(new GridLayout(1, 3));
		bg = new ButtonGroup();
		enterItemButton = new JButton("Enter Item");
		totalButton = new JButton("Total");
		newOrderButton = new JButton("New Order");

		buttonPanel.setSize(150, 780);
		buttonPanel.add(enterItemButton);
		bg.add(enterItemButton);
		buttonPanel.add(totalButton);
		bg.add(totalButton);
		buttonPanel.add(newOrderButton);
		bg.add(newOrderButton);
		setVisible(true);*/

	}
}
