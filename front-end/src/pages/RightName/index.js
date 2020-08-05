  
import styles from './style.js'


import SearchBar from '../../components/SearchBar/index'
import React from 'react';
import { View , Text,StatusBar} from 'react-native';

export default function RightName() {
  return (
    
    <View style={styles.container}>
      <h1> Right Name</h1>
      <StatusBar style="hide" />
    </View>
  );
}
