  
import styles from './style.js'
import * as React from 'react';
import { View , Text, StatusBar, FlatList,  } from 'react-native';
import { FontAwesome } from '@expo/vector-icons'; 
import RightGame from '../../components/RightGame/index'

//for each result of Search function will create one RightGame component
export default function RightName() {
  const teste = {
    nome:'a'
  }
  return (
    
    <View style={styles.container}>
      
      <View style={styles.header}>
        <FontAwesome name="arrow-left" color="#F21B3F" size={27}
            onPress={() =>  navigation.goBack()}//FIXME: go back to Search page
        />
      </View>
   
        <RightGame/>
   
      <StatusBar style="hide" />
    </View>
  );
}
