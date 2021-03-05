defmodule Bulma do
  defp aliases() do
    quote do
      alias Bulma.Text

      alias Bulma.Components.{
        Breadcrumb,
        Card,
        Dropdown,
        Menu,
        Message,
        Modal,
        ModalCard,
        Navbar,
        Pagination,
        Panel,
        Tabs
      }

      alias Bulma.Elements.{
        Block,
        Box,
        Button,
        Buttons,
        Content,
        Delete,
        Icon,
        IconText,
        Image,
        Notification,
        ProgressBar,
        Subtitle,
        Table,
        Tag,
        Tags,
        Title
      }

      alias Bulma.Form

      alias Bulma.Form.{
        Checkbox,
        Field,
        HelpText,
        HiddenInput,
        MultipleSelect,
        RadioField,
        RadioButton,
        Select,
        Submit,
        Textarea,
        TextInput
      }

      # EmailInput,
      # FileInput,
      # HiddenInput,
      # Label,
      # PasswordInput,
      # TelephoneInput
      alias Bulma.Layout.{
        Container,
        Column,
        Columns,
        Hero,
        Level,
        Media,
        Footer,
        Section,
        Tile
      }
    end
  end

  defmacro __using__(_) do
    quote do
      unquote(aliases())
    end
  end
end
