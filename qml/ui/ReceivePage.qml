import QtQuick 2.7
import QtQuick.Controls 2.2
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.3

Page {
    anchors.fill: parent
    header: PageHeader {
        id: header
        title: i18n.tr('uBitcoin')
    }

	Component.onCompleted: {
		python.call('backend.get_display_address', [], function(addr) {
			console.log('address: ' + addr);
            address.text = addr;
        })
        python.call('backend.get_qr', [], function(qr) {
			console.log(qr);
            qrAddress.source = qr;
		})
	}
	
    Label {
        id: address
        anchors {
            top: header.bottom
            left: parent.left
            right: parent.right
        }
        text: ''
        horizontalAlignment: Label.AlignHCenter
    }
    Rectangle {
    	id: qrWrapper
		anchors {
			top: address.bottom
			topMargin: 20
            horizontalCenter: parent.horizontalCenter
		}
        width: units.gu(30)
        height: units.gu(30)
		color: "white"
		border.color: "black"
		border.width: 2
		radius: 20
			
		Image {
			id: qrAddress
			anchors.fill: parent
			sourceSize.width: 1024
			sourceSize.height: 1024
		}
       }
}
