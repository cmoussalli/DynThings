using System;

namespace DynThings.Core.Languages
{
    public class LanguageData
    {
        public CommandsData Commands;



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


        #region Language: English
        private void SetLanguage_English()
        {
            Commands.Add = "Add";
            Commands.Edit = "Edit";
        }
        #endregion

        #region Language: Arabic
        private void SetLanguage_Arabic()
        {
            Commands.Add = "إضافة";
            Commands.Edit = "تعديل";
            

        }
        #endregion


        #region Props
        #region Props: Language Info
        public int LanguageID;
        public string LanguageName;

        #endregion

        #region Props: Commands

        #endregion



        #endregion



    }


    public class CommandsData
    {
        public string Add;
        public string Create;
        public string Edit;
        public string Delete ;
    }
}
