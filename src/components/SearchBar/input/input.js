import React, { useEffect, useRef} from 'react' 
import {useField} from '@unform/core';
import {TextInput} from 'react-native'

import styles from './style'

export default function Input({name}) {
    const inputRef = useRef(null);
    const { fieldName,registerField, error, defaultValue} = useField(name);

    useEffect(() => {
        console.log(inputRef.current.value);
    }, [inputRef]);

    return(
        <TextInput ref={inputRef} value='sa' style={styles.areaPesquisa}/>
    )
}