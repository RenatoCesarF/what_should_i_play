import React from 'react';
import { View, Button, Text } from 'react-native';
import { FontAwesome } from '@expo/vector-icons'; 

const List = ({ navigation }) => (
  <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
    <Text></Text>
    <Button
      title="Ir para About"
      onPress={() => navigation.navigate('Details') }
    />



  <FontAwesome name="remove"/>
  <FontAwesome name="search"/>
  <FontAwesome name="chevron-right"/>
  <FontAwesome name="chevron-left"/>

  </View>
);

List.navigationOptions = {
  title: 'List',
}

export default List;