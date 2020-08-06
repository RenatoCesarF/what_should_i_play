import {StyleSheet} from 'react-native' 

const styles = StyleSheet.create({
  container:{ 
      flex: 1,
      backgroundColor: '#130d2d',
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    width: "100%", 
    top: 0,
    borderBottomWidth: 3,
    borderColor: '#110e1F',
    paddingHorizontal: "6%",
    paddingVertical: "4%",
  }

});

export default styles;