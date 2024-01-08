import { ReactElement } from 'react';
import './index.css';

interface ButtonProps{
    onClick?: () => void;
    id?: string;
    children: ReactElement | string;
}

export const Button = (props: ButtonProps) => {
    return (
        <button className="button" id={props.id} onClick={props.onClick}>
            {props.children}
        </button>
    );
};