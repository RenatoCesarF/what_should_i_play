import React from 'react';
import styles from './style'
import { View,ScrollView,Image} from 'react-native';
import { FontAwesome } from '@expo/vector-icons'; 

//on open, run function Details() with game id that comes from list

export default function ListOf({ navigation }){
// onPress={() => navigation.navigate('Details') 
  return(
    <View style={styles.container}>
      <ScrollView
        horizontal={true}
        showsHorizontalScrollIndicator={true}
      >
      <Image 
          style={{ width: 100, height: 100, borderRadius: 30 }}
          resizeMode="contain"
          source={{ uri: "https://images.igdb.com/igdb/image/upload/t_cover_big/co23jy.jpg" }}
          onPress={() => navigation.navigate('Details')}
      />
      </ScrollView>
      <FontAwesome name="chevron-left" color="#F21B3F" size={30}/>
      <FontAwesome name="chevron-right" color="#F21B3F" size={30}/>
    </View>
);
}
ListOf.navigationOptions = {
  title: 'List',
}

