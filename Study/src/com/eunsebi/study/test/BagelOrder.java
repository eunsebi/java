package com.eunsebi.study.test;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.GridLayout;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class BagelOrder extends JFrame {
	JLabel topLabel;

	sizePanel sp = new sizePanel();
	typePanel tp = new typePanel();
	productsPanel pp = new productsPanel();
	buttonPanel bp = new buttonPanel();
	extrasPanel ep = new extrasPanel();

	public BagelOrder() {
		setTitle("Order Entry Screen");
		setSize(800, 800);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		topLabel = new JLabel("Order Entry Screen");
		add(pp, BorderLayout.WEST);
		add(topLabel, BorderLayout.NORTH);
		add(bp, BorderLayout.SOUTH);
		add(middleCoffeePanelSetBuild(), BorderLayout.CENTER);
		//add(east, BorderLayout.EAST);
		setVisible(true);

	}

	private JPanel middleCoffeePanelSetBuild() {
		JPanel middlePanel = new JPanel(new GridLayout(3, 1));
		add(sp);
		add(tp);
		add(ep);
		return middlePanel;

	}

	public static void main(String args[]) {
		BagelOrder bo = new BagelOrder();
	}

}
