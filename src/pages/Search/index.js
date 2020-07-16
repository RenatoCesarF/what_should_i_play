  
import styles from './style.js'

import SearchBar from '../../components/SearchBar/index'

import React from 'react';
import { View , Text,StatusBar} from 'react-native';

export default function SearchPage() {
  return (
    
    <View style={styles.container}>

      <View style={styles.titleLocal}>
        <Text style={styles.titulo}>What Should I Play?</Text>
      </View>

      <SearchBar/>

      <StatusBar style="auto" />
    </View>
  );
}
