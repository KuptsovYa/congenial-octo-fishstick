#include <iostream>
#include <vector>
#include <string>
#include <windows.h>
#include <tchar.h>
#include <conio.h>
#include <strsafe.h>

// Определение констант
const char* szAlpha = "abcdef";
const char* szStr[] = {
    "mnbvaq", "cxzlbr", "kjhgct", "fdsady", "poiueu",
    "ytrefo", "wqalgx", "ksjdhv", "hfgbif", "qazwja",
    "sxedkf", "crfvlg", "tgbymh", "hnujni", "miklop", "plokpc"
};

unsigned int sn = 0x29E07C;
char buffer[16] = { 0 };

// Функция для генерации символов
void Generate(const char* lpStr, int bufferIndex) {
    const int divider = 0x1A;
    const int normalizer = 0x61;

    for (int i = 0; i < 6; ++i) {
        int elem = lpStr[i];
        int elemBuffer = buffer[bufferIndex + i];
        elemBuffer = elemBuffer + elem - 0xC2;
        elem = elemBuffer % divider;
        elem += normalizer;
        buffer[bufferIndex + i] = static_cast<char>(elem);
    }
}

// Основная функция
void Main() {
    int result0, result1, result2;

    strcpy(buffer, szAlpha);

    result0 = sn;

    result1 = result0 / 100;
    result1 = result0 % 9;

    const char* table1 = szStr[result1];
    Generate(table1, 0);

    result1 = result1 / 7;

    const char* table2 = szStr[result1 + 9];
    Generate(table2, 0);

    result0 = result0 / 0x3F;
    result1 = result0 % 9;

    const char* table3 = szStr[result1];
    Generate(table3, 0);

    result1 = result1 / 7;

    const char* table4 = szStr[result1 + 9];
    Generate(table4, 0);

    result0 = result0 / 0x3F;
    result1 = result0 % 9;

    const char* table5 = szStr[result1];
    Generate(table5, 0);

    result1 = result1 / 7;

    const char* table6 = szStr[result1 + 9];
    Generate(table6, 0);

    Generate(szStr[7], 0);
    Generate(szStr[10], 0);
    Generate(szStr[0], 0);
    Generate(szStr[9], 0);

    buffer[6] = 'c';
    buffer[7] = 'l';
    buffer[8] = 0;

    std::cout << sn << "-" << buffer << std::endl;
}

// Главная функция
int main() {

    TCHAR szOldTitle[MAX_PATH];
    TCHAR szNewTitle[MAX_PATH];

    if (GetConsoleTitle(szOldTitle, MAX_PATH))
    {

        StringCchPrintf(szNewTitle, MAX_PATH, TEXT("TEST: %s"), szOldTitle);

        if (!SetConsoleTitle(szNewTitle))
        {
            _tprintf(TEXT("SetConsoleTitle failed (%d)\n"), GetLastError());
            return 1;
        }
        else
        {
            _tprintf(TEXT("SetConsoleTitle succeeded.\n"));
        }
    }
    
    system("mode con: cols=80 lines=25");
    CONSOLE_CURSOR_INFO cursorInfo;
    GetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE), &cursorInfo);
    cursorInfo.bVisible = false;
    SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE), &cursorInfo);

    Main();

    _getch(); // Ждет нажатия клавиши
    return 0;
}