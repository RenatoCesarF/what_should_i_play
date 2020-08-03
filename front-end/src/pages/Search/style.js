import {StyleSheet} from 'react-native' 

const styles = StyleSheet.create({
  container:{ 
      flex: 1,
      backgroundColor: '#1F1A38',
    },
    title:{
      //fontFamily: 'Press Start 2P',
      color: '#F21B3F',
      fontSize: 80,
      textAlign: 'center',
      textAlignVertical: 'top',
      marginTop: '10%'
    },

    description:{
      color: '#979797',
      fontSize: 16,
      textAlign: 'center',
      marginLeft: 30,
      marginRight: 30,
      paddingTop: 30,
      marginBottom: 30
    }

});

export default styles;