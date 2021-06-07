import QtQuick 2.15
import QtQuick.Window 2.2
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11

ApplicationWindow {
    id:mainWindow
    width: 1920
    height: 1080
    visible: Qt.WindowMaximized
    title: qsTr("Oyun")

    property var kaynakSayi: 0;
    property var  yY: Math.ceil(Math.random() * mainWindow.height)
    property var  xX: Math.ceil(Math.random() * mainWindow.width)
    property var yyY: yY%10
    property var xxX: xX%10


    background: AnimatedImage{
        id: animatedImage
        source: "qrc:/src/images/backGif.gif";
        width: parent.width;
        height: parent.height;
        Keys.onUpPressed:{
            console.log("move up")
            upBtn()
        }
        Keys.onDownPressed:{
            console.log("move down")
            downBtn()
        }
        Keys.onLeftPressed:{
            console.log("move left")
            leftBtn()
        }
        Keys.onRightPressed:{
            console.log("move right")
            rightBtn()
        }
        Keys.onEscapePressed: {
            Qt.quit()
        }

        Text {
            id: skor
            text: "Skor: "+kaynakSayi
            color: "white"
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 30
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width/4
            height: parent.height/10
        }

        function upBtn(){
            //console.log("Gemi: "+spaceship.y)
            //console.log("Ekran: "+(mainWindow.height-mainWindow.height))
            spaceship.y>0 ? spaceship.y-=10 : spaceship.y-=0 ;
            kaynakTopla(spaceship.x,spaceship.y);
        }
        function downBtn(){
            //console.log("Gemi: "+spaceship.y)
            //console.log("Ekran: "+mainWindow.height)
            spaceship.y<mainWindow.height-100 ? spaceship.y+=10 : spaceship.y+=0 ;
            kaynakTopla(spaceship.x,spaceship.y);
        }
        function leftBtn(){
            //console.log("Gemi: "+spaceship.x)
            //console.log("Ekran: "+(mainWindow.width-mainWindow.width))
            spaceship.x>0 ? spaceship.x-=10 : spaceship.x-=0 ;
            kaynakTopla(spaceship.x,spaceship.y);
        }
        function rightBtn(){
            //console.log("Gemi: "+spaceship.x)
            //console.log("Ekran: "+mainWindow.width)
            spaceship.x<mainWindow.width-100 ? spaceship.x+=10 : spaceship.x+=0 ;
            kaynakTopla(spaceship.x,spaceship.y);
        }

        function kaynakTopla(x,y){
            var xDegeri=x;
            var yDegeri=y;

            console.log("Gelen x degeri: "+x)
            console.log("Gelen y degeri: "+y)
            console.log("Kaynak x degeri: "+(xX-xxX))
            console.log("Kaynak y degeri: "+(yY-yyY))
            if(xDegeri===(xX-xxX) && yDegeri===(yY-yyY)){
                kaynakSayi+=1;
                xX=Math.ceil(Math.random() * mainWindow.width);
                yY=Math.ceil(Math.random() * mainWindow.height)
            }
        }

        Rectangle{
            id:kaynak
            x:xX
            y:yY
            width: 100
            height: 100
            color: "blue"
        }

        Rectangle {
            id: spaceship
            x: 300
            y: 400
            width: 100
            height: 100
            color: "transparent"
            border.color: "#c70d0d"
            border.width: 1
            BorderImage {
                id: spaceship_img
                anchors.fill: parent
                source: "qrc:/src/images/spaceship.png"
                //fillMode: Image.PreserveAspectFit
            }
        }

        Button{
            id:playBtn
            width: parent.width/10
            height: parent.height/10
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            text: "OYNA"
            onClicked: {
                playBtn.visible=false;
            }
        }




        /*Rectangle{
            id:controller
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: parent.width/8
            height: parent.width/8
            color: "pink"

            Button{
                id:upButton
                width: parent.width/4
                height: parent.height/4
                text: "YUKARI"
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter

            }
            Button{
                id:downButton
                width: parent.width/4
                height: parent.height/4
                text: "AŞAĞI"
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Button{
                id:leftButton
                width: parent.width/4
                height: parent.height/4
                text: "SOL"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
            }
            Button{
                id:rightButton
                width: parent.width/4
                height: parent.height/4
                text: "SAĞ"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
            }

        }*/
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
