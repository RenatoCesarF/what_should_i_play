import React from 'react';
import { View, Button, Text } from 'react-native';

const List = ({ navigation }) => (
  <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
    <Text></Text>
    <Button 
      title="Ir para About"
      onPress={() => navigation.navigate('Details') }
    />
  </View>
);

List.navigationOptions = {
  title: 'List',
}

export default List;