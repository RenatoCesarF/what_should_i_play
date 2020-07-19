import React from 'react';
import styles from './style'
import { View, Button, Text,StatusBar } from 'react-native';

import { FontAwesome } from '@expo/vector-icons'; 

const Details = () => (
  <View style={ styles.container}>

    <View style={styles.header}>
      <FontAwesome name="arrow-left" color="#F21B3F" size={27}/>
      <FontAwesome name="bookmark" color="#F21B3F" size={27}/>
    </View>

    <FontAwesome name="trophy" color="#F21B3F"/>
    <FontAwesome name="credit-card-alt" color="#F21B3F" size={27}/>
    <FontAwesome name="youtube-play" color="#F21B3F" size={27}/>
    

    <StatusBar style="auto" />
  </View>
);


// on click in setinha navigation.pop(); 

export default Details;