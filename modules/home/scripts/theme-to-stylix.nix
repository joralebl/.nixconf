{
  pkgs,
  username,
}:
pkgs.writeShellScriptBin "theme-to-stylix.sh" ''

  #! /usr/bin/env bash

      # JSON to Base16 YAML Theme Converter
      # Converts a simple JSON color scheme to base16 YAML format

      # Input and output files
  INPUT_FILE="/home/${username}/.config/noctalia/colors.json"
  OUTPUT_FILE="/home/${username}/.nixconf/colors16.yaml"
  TEMP_FILE=$(mktemp)

  # Check if input file exists
  if [ ! -f "$INPUT_FILE" ]; then
      echo "Error: Input file '$INPUT_FILE' not found"
      rm -f "$TEMP_FILE"
      exit 1
  fi

  # Create the base YAML structure
  cat > "$OUTPUT_FILE" << 'EOF'
  system: "base16"
  name: "Custom Theme"
  author: "Theme Author"
  variant: "dark"
  palette:
  EOF

  # Parse JSON and create base16 palette mapping
  sed 's/[{}]//g; s/"//g; s/,//g; s/^\s*//; s/\s*$//' "$INPUT_FILE" | while IFS=: read -r key value; do
      # Skip empty lines
      [ -z "$key" ] && continue
  
      # Trim whitespace from key and value
      key=$(echo "$key" | xargs)
      value=$(echo "$value" | xargs)
  
      # Map color key to base16 slot(s)
      case "$key" in
   		"mSurface")      echo "base00=$value" >> "$TEMP_FILE" ;;
        "mSurfaceVariant") 	echo "base01=$value" >> "$TEMP_FILE" ; echo "base02=$value" >> "$TEMP_FILE" ;;
        "mOnSurfaceVariant") echo "base03=$value" >> "$TEMP_FILE" ; echo "base05=$value" >> "$TEMP_FILE" ;;
        "mOutline") echo "base04=$value" >> "$TEMP_FILE" ;;
        "mOnSurface")    echo "base06=$value" >> "$TEMP_FILE";
  	  			 echo "base07=$value" >> "$TEMP_FILE" ;;
        "mPrimary")      echo "base08=$value" >> "$TEMP_FILE" ;;
        "mSecondary")    echo "base09=$value" >> "$TEMP_FILE" ;;
        "mTertiary")     echo "base0A=$value" >> "$TEMP_FILE" ;;
        "mHover")        echo "base0B=$value" >> "$TEMP_FILE" ;;
        "mOnSecondary")  echo "base0C=$value" >> "$TEMP_FILE" ;;
        "mOnTertiary")   echo "base0D=$value" >> "$TEMP_FILE" ;;
        "mOnHover")      echo "base0E=$value" >> "$TEMP_FILE" ;;
        "mError")        echo "base0F=$value" >> "$TEMP_FILE" ;;
   	  esac
  done

  # Write palette entries to output file
  for base in base00 base01 base02 base03 base04 base05 base06 base07 base08 base09 base0A base0B base0C base0D base0E base0F; do
      value=$(grep "^$base=" "$TEMP_FILE" | cut -d= -f2 | tail -1)
      if [ -n "$value" ]; then
          echo "  $base: \"$value\"" >> "$OUTPUT_FILE"
      fi
  done

  rm -f "$TEMP_FILE"
  echo "Theme created successfully: $OUTPUT_FILE"''
