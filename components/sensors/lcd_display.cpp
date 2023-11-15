#include "lcd_display.h"

LCD_Display::LCD_Display(QObject *parent)
    : QAbstractItemModel(parent)
{
}

QVariant LCD_Display::headerData(int section, Qt::Orientation orientation, int role) const
{
    // FIXME: Implement me!
}

QModelIndex LCD_Display::index(int row, int column, const QModelIndex &parent) const
{
    // FIXME: Implement me!
}

QModelIndex LCD_Display::parent(const QModelIndex &index) const
{
    // FIXME: Implement me!
}

int LCD_Display::rowCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return 0;

    // FIXME: Implement me!
}

int LCD_Display::columnCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return 0;

    // FIXME: Implement me!
}

QVariant LCD_Display::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // FIXME: Implement me!
    return QVariant();
}
