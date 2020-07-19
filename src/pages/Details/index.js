import React from 'react';
import styles from './style'
import { View, Button, Text } from 'react-native';

import { FontAwesome } from '@expo/vector-icons'; 

const Details = () => (
  <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
    <Text>Details</Text>


    <FontAwesome name="arrow-left"/>
    <FontAwesome name="bookmark"/>
    <FontAwesome name="trophy"/>
    <FontAwesome name="credit-card-alt"/>
    <FontAwesome name="youtube-play"/>
    
  </View>
);


// on click in setinha navigation.pop(); 

export default Details;