  
import styles from './style.js'
import React from 'react';
import { View , Text, StatusBar } from 'react-native';

import RightGame from '../../components/RightGame/index'
import SearchBar from '../../components/SearchBar/index'

//for each result of Search function will create one RightGame component

export default function RightName() {
  return (
    
    <View style={styles.container}>
      
      <View style={styles.header}>
        <FontAwesome name="arrow-left" color="#F21B3F" size={27}
            onPress={() =>  navigation.goBack()}
        />
        <FontAwesome name="bookmark" color="#F21B3F" size={27}/>
      </View>

      <RightGame/>
      <h1> You mean:</h1>
      <StatusBar style="hide" />
    </View>
  );
}
