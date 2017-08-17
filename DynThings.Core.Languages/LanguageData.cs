using System;

namespace DynThings.Core.Languages
{
    public partial class LanguageData
    {
        

        #region Enums
        public enum Language
        {
            English = 1,
            Arabic = 2
        }
        #endregion

        #region Language Changer
        public LanguageData(Language language)
        {
            switch (language)
            {
                case Language.Arabic:
                    SetLanguage_Arabic();
                    break;

                default:
                    SetLanguage_English();
                    break;
            }
        }
        #endregion

        #region Props

        public int LanguageID;
        public string LanguageName;
        public bool RightToLeft;

        public CommandsData Commands;
        public MessagesData Messages;
        public ComponentsData Components;

        #endregion






    }

}
