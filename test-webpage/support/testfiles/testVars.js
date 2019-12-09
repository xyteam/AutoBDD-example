const All = {
    robotDialogWindowTextRegex: 'vArmour Bot\\s.* Pssst\\.\\.\\. want to see how our\\s.* platform helps CISOs\\?'
  };
  
  const CH = {
  };
  
  const IE = {
  };
  
  // The properties are overwritten by other objects that have the same properties later in the parameters order
  module.exports = Object.assign(All, eval(process.env.BROWSER));
  
  