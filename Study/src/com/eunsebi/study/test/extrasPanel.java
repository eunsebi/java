package com.eunsebi.study.test;

import java.awt.GridLayout;
import javax.swing.BorderFactory;
import javax.swing.JCheckBox;
import javax.swing.JPanel;
import javax.swing.border.Border;

public class extrasPanel extends JPanel {
	public extrasPanel() {
		JPanel extrasPanel = new JPanel(new GridLayout(2, 1));

		JCheckBox creamCheckBox = new JCheckBox("Cream");
		JCheckBox sugarCheckBox = new JCheckBox("Sugar");

		extrasPanel.setSize(200, 200);
		extrasPanel.add(creamCheckBox);
		extrasPanel.add(sugarCheckBox);

		Border etched = BorderFactory.createEtchedBorder();
		Border titled = BorderFactory.createTitledBorder(etched, "Extras");
		extrasPanel.setBorder(titled);
		setVisible(true);
	}
}
