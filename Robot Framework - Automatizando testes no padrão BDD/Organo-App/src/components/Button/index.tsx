import { ReactElement } from 'react';
import './index.css';

interface ButtonProps{
    id?: string;
    children: ReactElement | string;
}

export const Button = (props: ButtonProps) => {
    return (
        <button className="button" id={props.id}>
            {props.children}
        </button>
    );
};