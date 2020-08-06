import { StyleSheet } from 'react-native';
 
const styles = StyleSheet.create({
    container:{
        flex: 1,
        backgroundColor: '#1F1A38',
        justifyContent: 'center',
    },
    header:{
        flexDirection: 'row',
        justifyContent: 'space-between',
        width: "100%", 
        top: 0,
        borderBottomWidth: 3,
        borderColor: '#110e1F',
        paddingHorizontal: "6%",
        paddingVertical: "4%",
    },
    details:{
        paddingHorizontal: "3%",
        position: "relative",
        flex: 1
    },
    topic:{
        color: "#979797",
        lineHeight: 50,
        fontSize: 20
    },

    action:{
        color: "#979797",
        paddingTop: 30,
        lineHeight: 50,
        fontSize: 20
    },
    imageView:{
        flex: 1,
        backgroundColor: '#130d2d',
        alignItems: "center",
        paddingTop: 10,
        paddingBottom: 10,
        borderBottomWidth: 3,
        borderColor: '#110e1F',
        
    }
});



export default styles;