Uri address = Uri.parse("http://developer.alexanderklimov.ru");
Intent openLinkIntent = new Intent(Intent.ACTION_VIEW, address);

//провекра есть ли программа способная выполнить намерение
if (openLinkIntent.resolveActivity(getPackageManager()) != null) {
    startActivity(openlinkIntent);
} else {
    Log.d("Intent", "Не получается обработать намерение!");
}
