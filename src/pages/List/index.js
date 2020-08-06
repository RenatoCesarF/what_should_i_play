import React from 'react';
import { View, Button, Text,StatusBar } from 'react-native';
import { FontAwesome } from '@expo/vector-icons'; 

import styles from './style'
import ListOf from '../../components/ListOf/index'

const List = ({ navigation }) => (
  <View style={styles.container}>
    
    <View style={styles.header}>
      <FontAwesome name="arrow-left" color="#F21B3F" size={27}
          onPress={() =>  navigation.goBack()}
      />
    </View>

    <ListOf/>

      <StatusBar style="auto" />
    </View>
);

List.navigationOptions = {
  title: 'List',
}

export default List;