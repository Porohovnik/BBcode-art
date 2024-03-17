import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3

Window {
    id:okno
    visible: true
    width: 715
    height: 400
    property color elements:"red"
    property color fill:"white"
    property string name:"g"
    property int razmer_x:20
    property int razmer_y:20
    Grid{
        id:tabl
        rows:razmer_x
        columns:razmer_y
        x:okno.width/8
        Repeater{
        id:repeater
        model:(razmer_x*razmer_y)
        Rectangle{
            id:index
            width: okno.height/razmer_x
            height:okno.height/razmer_y

            color:fill
            border.color:"#181818"
            MouseArea{
                anchors.fill:parent
                acceptedButtons: Qt.LeftButton|Qt.RightButton
                onPressed:{
                if(mouse.button === Qt.RightButton){
                    parent.color="white"}
                else{
                  parent.color=elements

                }
                }

            }
            }
            }
        }
    Grid{
        id:col
        x:tabl.width+okno.width/8
        rows:15
        columns:10
        Repeater{
        model:["SlateGray","LightCyan","DarkSlateGray","CadetBlue", "PaleTurquoise","Teal" ,"DarkCyan", "DarkTurquoise","Aqua", "MediumTurquoiseTurquoise", "LightSeaGreen", "Aquamarine" ,"MediumAquamarine", "MediumSpringGreen", "MediumSeaGreen","SeaGreen", "DarkSeaGreen", "PaleGreen", "LightGreen", "SpringGreen", "DarkGreen", "Green" ,"ForestGreen" ,"LimeGreen" ,"Lime" ,"Chartreuse" ,"LawnGreen" ,"GreenYellow" ,"yellowgreen" ,"Olivedrab", "DarkOliveGreen" ,"Olive" ,"DarkKhaki" ,"Khaki" ,"PaleGoldenrod" ,"LemonChiffon" ,"Honeydew" ,"LightGoldenrodYellow" ,"LightYellow", "Yellow" ,"Gold" ,"DarkGoldenRod" ,"Goldenrod" ,"Orange", "DarkOrange", "Peru", "Moccasin" ,"OldLace" ,"Linen" ,"Beige" ,"AntiqueWhite" ,"Cornsilk" ,"PapayaWhip" ,"BlanchedAlmond", "Bisque", "NavajoWhite" ,"Wheat" ,"BurlyWood", "Tan" ,"SandyBrown" ,"Chocolate", "SaddleBrown", "Sienna", "OrangeRed","Maroon", "DarkRed", "Brown", "FireBrick", "Crimson", "Red", "Tomato","Coral" ,"PeachPuff" ,"LightSalmon", "DarkSalmon", "Salmon" ,"IndianRed", "LightCoral", "RosyBrown", "PaleVioletRed", "MistyRose" ,"LightPink" ,"Pink", "HotPink" ,"MediumVioletRed", "DeepPink", "Fuchsia", "Magenta", "DarkMagenta", "Purple" ,"Lavender", "LavenderBlush" ,"Thistle", "Plum" ,"Violet" ,"Orchid" ,"MediumOrchid" ,"DarkViolet", "DarkOrchid" ,"BlueViolet" ,"MediumPurple" ,"Indigo", "MediumSlateBlue", "SlateBlue" ,"DarkSlateBlueLightSteelBlue", "MidnightBlue", "RoyalBlue," ,"CornflowerBlue" ,"DodgerBlue" ,"Navy" ,"DarkBlue", "MediumBlue" ,"Blue", "DeepSkyBlue" ,"LightSkyBlue" ,"SkyBlue" ,"SteelBlue", "LightBlue", "PowderBlue" ,"White" ,"Snow" ,"MintCream" ,"Azure", "AliceBlue", "GhostWhite" ,"WhiteSmoke" ,"Seashell" ,"FloralWhite" ,"Ivory" ,"Gainsboro" ,"LightGray", "Silver" ,"DarkGray" ,"Gray" ,"DimGray" ,"Grey", "Black"  ]
        Rectangle{
            width: okno.width/32
            height:okno.width/32
            color:modelData
            MouseArea{
                anchors.fill:parent
                acceptedButtons: Qt.LeftButton
                onPressed:{
                    elements=modelData}

                }
                }

            }
        }
    Grid{
        id:knp
        x:tabl.width+okno.width/8
        y:col.height
        rows:3
        columns:4
        Rectangle{
        anchors.rightMargin:4
        width: okno.width/10
        height:okno.height/10
        radius:20
        color:"black"
        Text{
            id:txt
            text:"Fill"
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 18
            color:"white"
        }
        MouseArea{
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill:parent
            acceptedButtons: Qt.LeftButton
            onPressed:{
                for(var i=0;i<(razmer_x*razmer_y);++i){
                    repeater.itemAt(i).color=elements}

            }
        }


        }
        Rectangle{
        width: okno.width/10
        height:okno.height/10
        radius:20
        color:"black"
        Text{
            text:"Kod"
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 18
            color:"white"
        }
        MouseArea{
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill:parent
            acceptedButtons: Qt.LeftButton
            onPressed:{texte.code()


            }
        }


        }

    }
    Rectangle{
    id:textes
    height:okno.height-(col.height+knp.height)
    width:200
    x:tabl.width+okno.width/8
    y:col.height+knp.height
        Flickable{
        height:150
        width:200
        contentHeight:1000
        contentWidth: 1000
         TextEdit{
            id:texte
            font.family: "Times New Roman"
            overwriteMode:true
           function code()
            {var cod=""
                for(var i=0;i<(razmer_x*razmer_y);++i){
                     cod =cod +"[background=" + repeater.itemAt(i).color+"]"+"[color="+repeater.itemAt(i).color+"]"+"....."+"[/color][/background]";
                   if(i!=0)
                    if((i+1)%razmer_y==0){
                     cod = cod +"\n" }
                }
                    return text = cod}
            renderType: Text.NativeRendering
            activeFocusOnPress: true
            cursorVisible: true
            selectionColor: "#008068"
            font.pointSize: 16
         }

        }
    }
    Grid{
    width:okno.width/8
    rows:4
    columns:1
    SpinBox {
        id: changed_x
        value:razmer_x
        onValueChanged:razmer_x=changed_x.value
        width:okno.width/8
        height: okno.height/10
    }

    SpinBox {
        id: changed_y
        value:razmer_y
        width:okno.width/8
        height: okno.height/10
        onValueChanged:razmer_y=changed_y.value
    }


    }

ItemDelegate {
    id: itemDelegate
    x: 0
    y: 71
    width: 89
    height: 55
    text: qsTr("Item Delegate")
}
}

