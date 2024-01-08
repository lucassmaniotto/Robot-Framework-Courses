import { useState } from "react";
import { v4 as id } from "uuid";
import { IUser } from "../../shared/interfaces/iUser";

import Input from "../Input";
import Select from "../Select";
import { Button } from "../Button";
import HideFormButton from "../HideFormButton";

import "./index.css";

interface FormProps {
    forRegisteredUser: (user: IUser) => void;
    crews: string[];
    users: IUser[];
    forHideForm: () => void;
    forRegisteredNewCrew: (crew: {name: string, color: string}) => void;
}


const Form = ({forRegisteredUser, forHideForm, forRegisteredNewCrew, crews, users}: FormProps) => {

    const [name, setName] = useState('');
    const [charge, setCharge] = useState('');
    const [image, setImage] = useState('');
    const [crew, setCrew] = useState('');
    const [crewName, setNewCrew] = useState('');
    const [color, setColor] = useState('#6278f7');

    const onSave = (event: React.FormEvent<HTMLFormElement>) => {
        event.preventDefault();
        forRegisteredUser({
            id: id(),
            name, 
            charge, 
            image, 
            crew 
        });
        setName('');
        setCharge('');
        setImage('');
        setCrew('');
    };

    const onRegisterNewCrew = (event: React.FormEvent<HTMLFormElement>) => {
        event.preventDefault();
        forRegisteredNewCrew({name: crewName, color: color});
        setNewCrew('');
        setColor('#6278f7');
    }

    const verifyIfRequiredFieldsAreFilled = () => {
        const nameInput = document.getElementById('name') as HTMLInputElement;
        const chargeInput = document.getElementById('charge') as HTMLInputElement;
        const crewInput = document.getElementById('crew') as HTMLInputElement;

        
        if (nameInput?.hasAttribute('required') && chargeInput?.hasAttribute('required') && crewInput?.hasAttribute('required')) {
            const errorMessage = document.createElement('p');
            errorMessage.classList.add('error-message');
            errorMessage.innerText = 'Preencha todos os campos obrigatórios.';

            const hasErrorMessage = document.querySelector('.error-message');

            if (hasErrorMessage) {
                hasErrorMessage.remove();
            }

            if (!nameInput.value || !chargeInput.value || !crewInput.value) {
                if (!nameInput.value) {
                    nameInput.classList.add('error-field');
                } else {
                    nameInput.classList.remove('error-field');
                }
    
                if (!chargeInput.value) {
                    chargeInput.classList.add('error-field');
                } else {
                    chargeInput.classList.remove('error-field');
                }
    
                if (!crewInput.value) {
                    crewInput.classList.add('error-field');
                } else {
                    crewInput.classList.remove('error-field');
                }
    
                const form = document.querySelector('.section__form-wrapper');
                form?.appendChild(errorMessage);
            }
        }
    }

    return (
        <section className="section__form">
            <div className="section__form-div">
                <form className="section__form-wrapper " onSubmit={onSave}>
                    <h2 className="section__form-title">Preencha os dados para criar o card do colaborador.</h2>
                    <Input
                        id="name"
                        className="input__data"
                        label="Nome"
                        required={true}
                        placeholder="Digite seu nome"
                        value={name}
                        onChange={value => setName(value)}
                    />
                    <Input
                        id="charge"
                        className="input__data"
                        label="Cargo" 
                        required={true} 
                        placeholder="Digite seu cargo" 
                        value={charge}
                        onChange={value => setCharge(value)}
                    />
                    <Input
                        id="image"
                        className="input__data"
                        label="Imagem" 
                        placeholder="https://..." 
                        value={image}
                        onChange={value => setImage(value)}
                    />
                    <Select
                        id="crew"
                        label="Time" 
                        itens={crews} 
                        required={true} 
                        value={crew}
                        onChange={value => setCrew(value)}
                    />
                    <Button id="button-person" onClick={verifyIfRequiredFieldsAreFilled}>Criar card</Button>
                </form>
                <form className="section__form-wrapper " onSubmit={onRegisterNewCrew}>
                    <h2 className="section__form-title">Ou crie um novo Time.</h2>
                    <div className="section__form-content">
                        <div className="section__form-colors">
                            <Input
                                id="crewName"
                                className="input__data input__data--color"
                                label="Nome do time"
                                required={true}
                                placeholder="Digite o nome do time"
                                value={crewName}
                                onChange={value => setNewCrew(value)}
                            />
                            <Input
                                id="color"
                                className="input__color"
                                label="Cor" 
                                required={true} 
                                type="color"
                                value={color}
                                onChange={value => setColor(value)}
                            />
                        </div>
                        <Button id="button-crew">Criar time</Button>
                    </div>
                </form>
            </div>
            {users.length > 0 && <HideFormButton onButtonPressed={forHideForm} />}
        </section>
    )
}

export default Form;