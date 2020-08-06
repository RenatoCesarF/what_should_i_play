import React from 'react';
import { View, Button, Text,StatusBar } from 'react-native';
import { FontAwesome } from '@expo/vector-icons'; 

import styles from './style'

const List = ({ navigation }) => (
  <View style={styles.container}>
    
    <View style={styles.header}>
      
    </View>

    <Button
      title="Botton test to go to Details page"
      onPress={() => navigation.navigate('Details') }
    />



      <FontAwesome name="chevron-right" color="#F21B3F" size={30}/>
      <FontAwesome name="chevron-left" color="#F21B3F" size={30}/>
      <StatusBar style="auto" />
    </View>
);

List.navigationOptions = {
  title: 'List',
}

export default List;