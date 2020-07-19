import React from 'react';
import { View, Button, Text,StatusBar } from 'react-native';
import { FontAwesome } from '@expo/vector-icons'; 

import SearchBar from '../../components/SearchBar/index'
import styles from './style'

const List = ({ navigation }) => (
  <View style={styles.container}>
    
    <View style={styles.header}>
      <SearchBar></SearchBar>
    </View>

    <Button
      title="Ir para About"
      onPress={() => navigation.navigate('Details') }
    />



      <FontAwesome name="chevron-right"/>
      <FontAwesome name="chevron-left"/>
      <StatusBar style="auto" />
    </View>
);

List.navigationOptions = {
  title: 'List',
}

export default List;