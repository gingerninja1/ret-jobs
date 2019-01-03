function validateInteger(val) {
    if (val == undefined || val == null)
        return false;
    //check for integer characters
    return /(^-?\d\d*$)/.test(val);
}

// Validates val is an integer >= minVal and <= maxVal
function validateIntegerRange(val, minVal, maxVal) {
    if (!validateInteger(val))
        return false;
    return ((val >= minVal) && (val <= maxVal));
}

function validateFloat(val) {
    if (val == undefined || val == null)
        return false;
    //check for float
    return /^[-+]?[0-9]*\.?[0-9]+$/.test(val);
}

function validateFloatRange(val, minVal, maxVal) {
    if (!validateFloat(val)) return false;
    return ((val >= minVal) && (val <= maxVal));
}

// Validates that a string is non-null and >= minLen characters and is <= maxLen characters
function validateString(val, minLen, maxLen) {
    if (val == undefined || val == null)
        return false;
    return ((val.length >= minLen) && (val.length <= maxLen));
}

// A phone number must contain digits and (,),.,- and space characters.
// It must be 10 digits in length.
function validatePhone(val) {
    var stripped = trim(val).replace(/[\(\)\.\-\ ]/g, '');
    //strip out acceptable non-numeric characters

    var phone_regex = /^(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})$/;
    return phone_regex.test(stripped);
}

function validatePresence(val) {
    return val != undefined && val.length > 0;
}

// A Full Name must have at least 2 words.
function validateFullName(val) {
    var first_name, last_name, split_index;
    split_index = val.indexOf(" ");
    if (split_index == -1) {
        return false;
    }
    first_name = val.substr(0,split_index);
    last_name = val.substr(split_index + 1);
    return validateSingleName(first_name) && validateSingleName(last_name);
}

// A single string >= 2 characters.
function validateSingleName(val){
    var keymash = /(([b-df-hj-np-tv-z])(?!\2)){5}/;
    var v = trim(val);
    return (v != null && v.length >= 2 && !keymash.test(v))
}

function validateEmail(val) {
    var illegalChars= /[\(\)\<\>\,\;\:\\\/\"\[\]]/;
    if (val == null || val.match(illegalChars)) {
        return false;
    }

    var emailFilter=/^([0-9a-zA-Z]([-.+\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]*\.)+[a-zA-Z]{2,9})$/;
    return emailFilter.test(trim(val));
}

// Must have exactly 5 digit zip
function validateZip(val, allowCanada) {
  var usZipRegex, caZipRegex, trimmed = trim(val);
  usZipRegex = new RegExp(/^\d\d\d\d\d$/);
  caZipRegex = new RegExp(/[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]/);
  if (usZipRegex.exec(val) != null) return true;
  if (allowCanada && caZipRegex.exec(val.toUpperCase()) != null) return true;

  return false;
}

// Validates date in mm/dd/yyyy or mm-dd-yyyy formats
function validateDateMDY(value){
    var validFormat=/^\d{1,2}[\/-]\d{1,2}[\/-]\d{4}$/ //Basic check for format validity
    if (!validFormat.test(value)) {
        return false;
    }
    else{ //Detailed check for valid date ranges
        var splitOn = "/";
        if (value[1] == "-" || value[2] == "-") splitOn = "-";
        var monthfield=value.split(splitOn)[0]
        var dayfield=value.split(splitOn)[1]
        var yearfield=value.split(splitOn)[2]
        var dayobj = new Date(yearfield, monthfield-1, dayfield)
        if ((dayobj.getMonth()+1!=monthfield)||(dayobj.getDate()!=dayfield)||(dayobj.getFullYear()!=yearfield)) {
            return false;
        }
        else {
            return true;
        }
    }
}

// For validating CC numbers
// See: http://en.wikipedia.org/wiki/Luhn_formula
function validateLuhn(val)
{
    var trimmed = trim(val);
    var sum = 0;
    var numdigits = trimmed.length;
    var parity = numdigits % 2;
    for(var i=0; i < numdigits; i++) {
        var digit = parseInt(trimmed.charAt(i))
        if(i % 2 == parity) digit *= 2;
        if(digit > 9) digit -= 9;
            sum += digit;
        }
    return (sum % 10) == 0;
}

// Remove white space
function trim(stringToTrim) {
    if (stringToTrim == null) return "";
	return stringToTrim.replace(/^\s+|\s+$/g,"");
}

// Validate a number
function validateNumber(val) {
    if (isNaN(val)) {
        return false
    } else {
        return true
    }
}

// Validate URL
function validateURL(val) {
    var validFormat = /^(?:http:\/\/|https:\/\/)?(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?$/i;
    if (!validFormat.test(val)) {
        return false;
    } else {
        return true;
    }
}

