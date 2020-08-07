  
import styles from './style.js'


import SearchBar from '../../components/SearchBar/index'
import React from 'react';
import { View , Text,StatusBar} from 'react-native';

export default function SearchPage() {
  return (
    
    <View style={styles.container}>

     
      <Text style={styles.title}>What Should {'\n'}I Play?</Text>
     
      
      <Text style={styles.description}>
        Write the name of a game that you have liked and I will show you some similars!
      </Text>
  

      <SearchBar/>

      <StatusBar style="hide" />
    </View>
  );
}
